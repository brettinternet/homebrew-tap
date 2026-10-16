class Worklease < Formula
  desc "Coordinate task and resource leases across local workers"
  homepage "https://github.com/brettinternet/worklease"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/brettinternet/worklease/releases/download/v1.9.2/worklease-v1.9.2-macos-arm64.tar.gz"
      sha256 "95472b86d78eaac8acbc32ebe97144e1f0ebff2d1a7d6296d55adafe89526c00"
    end
    on_intel do
      url "https://github.com/brettinternet/worklease/releases/download/v1.9.2/worklease-v1.9.2-macos-x64.tar.gz"
      sha256 "0b078e9cbe5e0a1ff8862fc931477f19eaf3ad37ee871603115bdce91484d547"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/brettinternet/worklease/releases/download/v1.9.2/worklease-v1.9.2-linux-arm64.tar.gz"
      sha256 "870546c9ea9dc49182a791f2cfdf094529bf75033aa33a6585877a741f1ea161"
    end
    on_intel do
      url "https://github.com/brettinternet/worklease/releases/download/v1.9.2/worklease-v1.9.2-linux-x64.tar.gz"
      sha256 "1cc1bf1e72e80973bc7826aaed9ae1bfd69b3a6b0f272239bb23b3abc55a2f67"
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
