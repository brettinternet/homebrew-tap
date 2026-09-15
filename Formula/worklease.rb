class Worklease < Formula
  desc "Coordinate task and resource leases across local workers"
  homepage "https://github.com/brettinternet/worklease"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/brettinternet/worklease/releases/download/v1.3.0/worklease-v1.3.0-macos-arm64.tar.gz"
      sha256 "83543c1e039c0a0776e3b43e63604bbb30401fa288be45fedf0622b6feaa242d"
    end
    on_intel do
      url "https://github.com/brettinternet/worklease/releases/download/v1.3.0/worklease-v1.3.0-macos-x64.tar.gz"
      sha256 "47625b423e109061fbcc620e6bcc56ec91056d4508acd1874a3e6517736f6f34"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/brettinternet/worklease/releases/download/v1.3.0/worklease-v1.3.0-linux-arm64.tar.gz"
      sha256 "5438ac1c8c5712534bf23f5c38941332138cf7ca7c125a1632d5c4e111b7d0e0"
    end
    on_intel do
      url "https://github.com/brettinternet/worklease/releases/download/v1.3.0/worklease-v1.3.0-linux-x64.tar.gz"
      sha256 "6c6f2d50bcd5e94f98b9db47ed591c44ae8c74af224cd92103df910cbf757c85"
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
