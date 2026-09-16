class Worklease < Formula
  desc "Coordinate task and resource leases across local workers"
  homepage "https://github.com/brettinternet/worklease"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/brettinternet/worklease/releases/download/v1.5.0/worklease-v1.5.0-macos-arm64.tar.gz"
      sha256 "08d283919b49ddace45d50061191aef8ba08068e38cc9a6758c08b36d111aa87"
    end
    on_intel do
      url "https://github.com/brettinternet/worklease/releases/download/v1.5.0/worklease-v1.5.0-macos-x64.tar.gz"
      sha256 "ee2a6bde32b773fc81d2c089718cb2ebf653fd701bfcf2729ac0daadf1efa258"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/brettinternet/worklease/releases/download/v1.5.0/worklease-v1.5.0-linux-arm64.tar.gz"
      sha256 "752151941308385cd20eab2dbb16a68d8f9dc54ecf77f9c3d1547b4704d45e17"
    end
    on_intel do
      url "https://github.com/brettinternet/worklease/releases/download/v1.5.0/worklease-v1.5.0-linux-x64.tar.gz"
      sha256 "504f6fd546154a22bf95d88fb3b84352932152974c2c2f057cefb1aaa226cd9d"
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
