class Hum < Formula
  desc "Local development process supervisor"
  homepage "https://github.com/brettinternet/hum"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/brettinternet/hum/releases/download/v0.12.0/hum-0.12.0-macos-arm64.tar.gz"
      sha256 "d3eee40db4a68a153034958c03062beff0241e2afa8bed1f3a74e60462fa1165"
    end
    on_intel do
      url "https://github.com/brettinternet/hum/releases/download/v0.12.0/hum-0.12.0-macos-x64.tar.gz"
      sha256 "af181e8fda0c763cded41aefa9a0ec3a210b6ebfd228563b56282b9aa49c7d35"
    end
  end

  def install
    bin.install "hum"
    man1.install "hum.1"
  end

  test do
    assert_match "hum version #{version}", shell_output("#{bin}/hum --version")
  end
end
