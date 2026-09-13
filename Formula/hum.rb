class Hum < Formula
  desc "Local development process supervisor"
  homepage "https://github.com/brettinternet/hum"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/brettinternet/hum/releases/download/v0.13.0/hum-0.13.0-macos-arm64.tar.gz"
      sha256 "3a4498efacebc1e8f8b7931f6f1e73fb54fe47b70a008bd18194df6895ecbb03"
    end
    on_intel do
      url "https://github.com/brettinternet/hum/releases/download/v0.13.0/hum-0.13.0-macos-x64.tar.gz"
      sha256 "8de1f3cb62bb540b7c90861fde6934f52ff222eeb6f44df452d1710a0dcdfff7"
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
