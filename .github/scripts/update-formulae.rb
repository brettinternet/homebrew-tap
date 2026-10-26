#!/usr/bin/env ruby
# frozen_string_literal: true

# Point formulae at the latest stable GitHub release of each project, using the
# release's own checksums.txt. Prints "FORMULA VERSION" for each changed formula.
#
# usage: update-formulae.rb [FORMULA...]   (default: every formula below)

require "json"
require "open3"
require "tmpdir"

OWNER = "brettinternet"

# asset: release asset name; %{version} has no leading "v". platforms: the
# asset's names for macOS arm64, macOS x64, Linux arm64, and Linux x64, in the
# order the formula lists them.
FORMULAE = {
  "bl" => {
    repository: "backlog",
    asset: "bl_%{platform}.tar.gz",
    platforms: %w[darwin_arm64 darwin_amd64 linux_arm64 linux_amd64],
  },
  "hum" => {
    repository: "hum",
    asset: "hum-%{version}-%{platform}.tar.gz",
    platforms: %w[macos-arm64 macos-x64 linux-arm64 linux-x64],
  },
  "noon" => {
    repository: "noon",
    asset: "noon-v%{version}-%{platform}.tar.gz",
    platforms: %w[macos-arm64 macos-x64 linux-arm64 linux-x64],
  },
  "tell" => {
    repository: "tell",
    asset: "tell-v%{version}-%{platform}.tar.gz",
    platforms: %w[macos-arm64 macos-x64 linux-arm64 linux-x64],
  },
  "worklease" => {
    repository: "worklease",
    asset: "worklease-v%{version}-%{platform}.tar.gz",
    platforms: %w[macos-arm64 macos-x64 linux-arm64 linux-x64],
  },
}.freeze

def gh(*args)
  output, status = Open3.capture2("gh", *args)
  abort "gh #{args.join(" ")} failed" unless status.success?
  output
end

def latest_version(repository)
  tag = JSON.parse(gh("release", "view", "--repo", "#{OWNER}/#{repository}", "--json", "tagName"))["tagName"]
  version = tag.delete_prefix("v")
  abort "#{repository}: latest release #{tag} is not vMAJOR.MINOR.PATCH" unless version.match?(/\A\d+\.\d+\.\d+\z/)

  version
end

def release_checksums(repository, version)
  Dir.mktmpdir do |dir|
    gh("release", "download", "v#{version}", "--repo", "#{OWNER}/#{repository}",
       "--pattern", "checksums.txt", "--dir", dir)
    File.readlines(File.join(dir, "checksums.txt"), chomp: true).each_with_object({}) do |line, checksums|
      fields = line.split
      abort "#{repository}: invalid checksum line: #{line}" unless fields.length == 2 && fields[0].match?(/\A[0-9a-f]{64}\z/)

      asset = File.basename(fields[1])
      abort "#{repository}: duplicate checksum for #{asset}" if checksums.key?(asset)

      checksums[asset] = fields[0]
    end
  end
end

# Matches one platform's url line and the sha256 line after it, at any version.
def asset_pattern(repository, asset_template, platform)
  asset = asset_template.gsub("%{platform}", platform).split("%{version}", -1).map { Regexp.escape(_1) }.join('[^/"]+')
  %r{(url "https://github\.com/#{OWNER}/#{Regexp.escape(repository)}/releases/download/)v[^/"]+/#{asset}"\n(\s+)sha256 "[0-9a-f]{64}"}
end

def update(name, config)
  version = latest_version(config[:repository])
  checksums = release_checksums(config[:repository], version)
  path = File.expand_path("../../Formula/#{name}.rb", __dir__)
  original = File.read(path)

  formula = config[:platforms].reduce(original) do |text, platform|
    asset = format(config[:asset], version:, platform:)
    checksum = checksums.fetch(asset) { abort "#{name}: v#{version} has no checksum for #{asset}" }
    pattern = asset_pattern(config[:repository], config[:asset], platform)
    abort "#{name}: expected one #{platform} url in #{path}" unless text.scan(pattern).length == 1

    text.sub(pattern) { "#{Regexp.last_match(1)}v#{version}/#{asset}\"\n#{Regexp.last_match(2)}sha256 \"#{checksum}\"" }
  end
  return if formula == original

  File.write(path, formula)
  puts "#{name} #{version}"
end

names = ARGV.empty? ? FORMULAE.keys : ARGV
names.each { |name| update(name, FORMULAE.fetch(name) { abort "unsupported formula: #{name}" }) }
