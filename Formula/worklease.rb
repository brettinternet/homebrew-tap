class Worklease < Formula
  desc "Coordinate task and resource leases across local workers"
  homepage "https://github.com/brettinternet/worklease"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/brettinternet/worklease/releases/download/v1.6.2/worklease-v1.6.2-macos-arm64.tar.gz"
      sha256 "fd615077494908c178522aa08592d9cb886a52b9df41c65abec13c680cec5337"
    end
    on_intel do
      url "https://github.com/brettinternet/worklease/releases/download/v1.6.2/worklease-v1.6.2-macos-x64.tar.gz"
      sha256 "eac9e74fc740eb6a6c4e1a690b358c3cc51371adc488a9c0e86bb16e0b27303f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/brettinternet/worklease/releases/download/v1.6.2/worklease-v1.6.2-linux-arm64.tar.gz"
      sha256 "835f2188d5df5cc7c74fc20871b7decc9b106af95ccca4e61d025b1d32bd3cec"
    end
    on_intel do
      url "https://github.com/brettinternet/worklease/releases/download/v1.6.2/worklease-v1.6.2-linux-x64.tar.gz"
      sha256 "58a302a61fc0af71b166e863ba84bdcc9221b39d985c50ae37f0ebf6d996f4e1"
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
