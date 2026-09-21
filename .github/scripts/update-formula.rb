#!/usr/bin/env ruby
# frozen_string_literal: true

formula_name, version, checksums_path = ARGV
abort "usage: update-formula.rb FORMULA VERSION CHECKSUMS" unless formula_name && version && checksums_path
abort "invalid version: #{version}" unless version.match?(/\A\d+\.\d+\.\d+(?:[-+][0-9A-Za-z.-]+)?\z/)

formulae = {
  "hum" => {
    repository: "hum",
    asset_version_prefix: "",
    platforms: %w[macos-arm64 macos-x64],
  },
  "worklease" => {
    repository: "worklease",
    asset_version_prefix: "v",
    platforms: %w[macos-arm64 macos-x64 linux-arm64 linux-x64],
  },
}
configuration = formulae.fetch(formula_name) { abort "unsupported formula: #{formula_name}" }

def asset_name(formula_name, version_prefix, version, platform)
  "#{formula_name}-#{version_prefix}#{version}-#{platform}.tar.gz"
end

def asset_url_pattern(repository, formula_name, version_prefix, platform)
  asset_stem = "#{formula_name}-#{version_prefix}"
  %r{(url "https://github\.com/brettinternet/#{repository}/releases/download/)v[^/]+/#{Regexp.escape(asset_stem)}[^/]+-#{Regexp.escape(platform)}\.tar\.gz"\n(\s+)sha256 "[0-9a-f]{64}"}
end

checksums = {}
File.readlines(checksums_path, chomp: true).each do |line|
  fields = line.split
  abort "invalid checksum line: #{line}" unless fields.length == 2 && fields[0].match?(/\A[0-9a-f]{64}\z/)

  asset = File.basename(fields[1])
  abort "duplicate checksum for #{asset}" if checksums.key?(asset)

  checksums[asset] = fields[0]
end

formula_path = File.expand_path("../../Formula/#{formula_name}.rb", __dir__)
formula = File.read(formula_path)

configuration[:platforms].each do |platform|
  asset = asset_name(formula_name, configuration[:asset_version_prefix], version, platform)
  checksum = checksums.fetch(asset) { abort "missing checksum for #{asset}" }
  pattern = asset_url_pattern(configuration[:repository], formula_name, configuration[:asset_version_prefix], platform)
  replacement = "\\1v#{version}/#{asset}\"\n\\2sha256 \"#{checksum}\""
  abort "could not update #{formula_name} #{platform}" unless formula.match?(pattern)

  formula = formula.sub(pattern, replacement)
end

File.write(formula_path, formula)
