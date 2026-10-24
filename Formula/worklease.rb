class Worklease < Formula
  desc "Coordinate task and resource leases across local workers"
  homepage "https://github.com/brettinternet/worklease"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/brettinternet/worklease/releases/download/v1.11.0/worklease-v1.11.0-macos-arm64.tar.gz"
      sha256 "cc717e6fd4a010457e6ecba756f202d2a107303629732b33d25b389f8247542c"
    end
    on_intel do
      url "https://github.com/brettinternet/worklease/releases/download/v1.11.0/worklease-v1.11.0-macos-x64.tar.gz"
      sha256 "c0a2f0ebfd0679665b5995cc79251d8c17be0ab139ba032631e6296c789c3298"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/brettinternet/worklease/releases/download/v1.11.0/worklease-v1.11.0-linux-arm64.tar.gz"
      sha256 "c77896c2c545c1e47e1921c0dfdbd8493ae015ae44fdcd55133962b8fa6b292b"
    end
    on_intel do
      url "https://github.com/brettinternet/worklease/releases/download/v1.11.0/worklease-v1.11.0-linux-x64.tar.gz"
      sha256 "c5cee82a04940978e1020ec661f4051a59486317471d5741b2e4f8650322b239"
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
