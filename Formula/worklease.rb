class Worklease < Formula
  desc "Coordinate task and resource leases across local workers"
  homepage "https://github.com/brettinternet/worklease"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/brettinternet/worklease/releases/download/v1.8.0/worklease-v1.8.0-macos-arm64.tar.gz"
      sha256 "4e013463bff477bd6cfb810336782608bc6c7052aab10002f6d8dcaaf21d450a"
    end
    on_intel do
      url "https://github.com/brettinternet/worklease/releases/download/v1.8.0/worklease-v1.8.0-macos-x64.tar.gz"
      sha256 "50a3222a09fd7502d1f27e76ec3da2f334bebf51f0e066a3015e664fd515bae5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/brettinternet/worklease/releases/download/v1.8.0/worklease-v1.8.0-linux-arm64.tar.gz"
      sha256 "34cfe548b43cfb6de4a79604e9600b38e6eddc3351b0fbb73a3f66e9df8063b5"
    end
    on_intel do
      url "https://github.com/brettinternet/worklease/releases/download/v1.8.0/worklease-v1.8.0-linux-x64.tar.gz"
      sha256 "eec85f18d276149b9a78c4bead06adb052b6cda654593fc8d791e881f60e17e7"
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
