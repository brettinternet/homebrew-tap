class Hum < Formula
  desc "Local development process supervisor"
  homepage "https://github.com/brettinternet/hum"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/brettinternet/hum/releases/download/v0.19.1/hum-0.19.1-macos-arm64.tar.gz"
      sha256 "2a3681c368ccc87418ffa6d7636f54bb94e3178d40025c88365c01d100f076a6"
    end
    on_intel do
      url "https://github.com/brettinternet/hum/releases/download/v0.19.1/hum-0.19.1-macos-x64.tar.gz"
      sha256 "f51ec25ef871addf32d6a22a239d3fd8fc903663e0f9578d2eff72ffc4c665c2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/brettinternet/hum/releases/download/v0.19.1/hum-0.19.1-linux-arm64.tar.gz"
      sha256 "c1eabb4156eef81e52aec509e634a7a73766bc3fd9ba120c10a16b92b2317a0f"
    end
    on_intel do
      url "https://github.com/brettinternet/hum/releases/download/v0.19.1/hum-0.19.1-linux-x64.tar.gz"
      sha256 "62607e150aa216dd54b0e60c5491f57483dc5c22c254de8cb2adc0bba8b571ca"
    end
  end

  def install
    bin.install "hum"
    man1.install "hum.1"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/hum --version")
  end
end
