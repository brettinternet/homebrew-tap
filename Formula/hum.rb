class Hum < Formula
  desc "Local development process supervisor"
  homepage "https://github.com/brettinternet/hum"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/brettinternet/hum/releases/download/v0.18.2/hum-0.18.2-macos-arm64.tar.gz"
      sha256 "f38681778698e994da08499f79fbd46bf276c36ba7b2156c5cd72759a031982b"
    end
    on_intel do
      url "https://github.com/brettinternet/hum/releases/download/v0.18.2/hum-0.18.2-macos-x64.tar.gz"
      sha256 "8618ee90877bf2d27586f43d301fe7dc01caff868e50274c74194ab8897ac430"
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
