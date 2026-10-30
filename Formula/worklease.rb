class Worklease < Formula
  desc "Coordinate task and resource leases across local workers"
  homepage "https://github.com/brettinternet/worklease"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/brettinternet/worklease/releases/download/v1.13.0/worklease-v1.13.0-macos-arm64.tar.gz"
      sha256 "463c89aba58d6e8918570beeeb550e413ead417a443b66f7765a9a93e72081dd"
    end
    on_intel do
      url "https://github.com/brettinternet/worklease/releases/download/v1.13.0/worklease-v1.13.0-macos-x64.tar.gz"
      sha256 "cca420fc43be20c0df83f253afe3d6bd0e61efc7decf0c97f490853fdbd29237"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/brettinternet/worklease/releases/download/v1.13.0/worklease-v1.13.0-linux-arm64.tar.gz"
      sha256 "f1f7d7a9ae1edf14930e8e8ac8b22f865e5ccd951cc01ba7e7b6aa8beff3c221"
    end
    on_intel do
      url "https://github.com/brettinternet/worklease/releases/download/v1.13.0/worklease-v1.13.0-linux-x64.tar.gz"
      sha256 "7ad79033bb072acdf215faefb370d9716f57a68098dbf2c84f87b5f8a5b391e2"
    end
  end

  def install
    bin.install "bin/worklease"
    man1.install "share/man/man1/worklease.1"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/worklease version")
  end
end
