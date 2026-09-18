class Worklease < Formula
  desc "Coordinate task and resource leases across local workers"
  homepage "https://github.com/brettinternet/worklease"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/brettinternet/worklease/releases/download/v1.7.1/worklease-v1.7.1-macos-arm64.tar.gz"
      sha256 "aa287ff828409c8f05a2bf27d60812e9195662531b294831873d6a1ba0cb1781"
    end
    on_intel do
      url "https://github.com/brettinternet/worklease/releases/download/v1.7.1/worklease-v1.7.1-macos-x64.tar.gz"
      sha256 "663c50e3553e806fc79ceb16fed8143eacf88c039c2b98952ab9a0f8bc373217"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/brettinternet/worklease/releases/download/v1.7.1/worklease-v1.7.1-linux-arm64.tar.gz"
      sha256 "fdde93aa678ff39188c0703dc97e46646e240bda1b6dadda7ec4678ed65187ed"
    end
    on_intel do
      url "https://github.com/brettinternet/worklease/releases/download/v1.7.1/worklease-v1.7.1-linux-x64.tar.gz"
      sha256 "be49b1cb3f0191ceb7d2d509b21b95592becb59cb5bfde4917baaef072b1164d"
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
