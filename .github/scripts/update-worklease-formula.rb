#!/usr/bin/env ruby
# frozen_string_literal: true

version, checksums_path = ARGV
abort "usage: update-worklease-formula.rb VERSION CHECKSUMS" unless version && checksums_path
abort "invalid version: #{version}" unless version.match?(/\A\d+\.\d+\.\d+(?:[-+][0-9A-Za-z.-]+)?\z/)

checksums = {}
File.readlines(checksums_path, chomp: true).each do |line|
  fields = line.split
  abort "invalid checksum line: #{line}" unless fields.length == 2 && fields[0].match?(/\A[0-9a-f]{64}\z/)

  asset = File.basename(fields[1])
  abort "duplicate checksum for #{asset}" if checksums.key?(asset)

  checksums[asset] = fields[0]
end

formula_path = File.expand_path("../../Formula/worklease.rb", __dir__)
formula = File.read(formula_path)
platforms = %w[macos-arm64 macos-x64 linux-arm64 linux-x64]

platforms.each do |platform|
  asset = "worklease-v#{version}-#{platform}.tar.gz"
  checksum = checksums.fetch(asset) { abort "missing checksum for #{asset}" }
  pattern = %r{(url "https://github\.com/brettinternet/worklease/releases/download/)v[^/]+/worklease-v[^/]+-#{Regexp.escape(platform)}\.tar\.gz"\n(\s+)sha256 "[0-9a-f]{64}"}
  replacement = "\\1v#{version}/#{asset}\"\n\\2sha256 \"#{checksum}\""
  abort "could not update #{platform}" unless formula.match?(pattern)

  formula = formula.sub(pattern, replacement)
end

File.write(formula_path, formula)
