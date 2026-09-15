class Hum < Formula
  desc "Local development process supervisor"
  homepage "https://github.com/brettinternet/hum"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/brettinternet/hum/releases/download/v0.14.1/hum-0.14.1-macos-arm64.tar.gz"
      sha256 "8980b9b116491748bdec46f42fba81a2bdc3db2d84cab170a8346ebfffb31098"
    end
    on_intel do
      url "https://github.com/brettinternet/hum/releases/download/v0.14.1/hum-0.14.1-macos-x64.tar.gz"
      sha256 "fb910be3c013876d38bdb0aa9fe4d460e44130d0b4e1c1d89aadf77038ae4bee"
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
