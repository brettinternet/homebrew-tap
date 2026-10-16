class Hum < Formula
  desc "Local development process supervisor"
  homepage "https://github.com/brettinternet/hum"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/brettinternet/hum/releases/download/v0.18.0/hum-0.18.0-macos-arm64.tar.gz"
      sha256 "82bddc425de9114234b1c7c541fddf4b0fbe97c396ff2451a2b8c5246a36441a"
    end
    on_intel do
      url "https://github.com/brettinternet/hum/releases/download/v0.18.0/hum-0.18.0-macos-x64.tar.gz"
      sha256 "ef5e75ac37ba49e38ee1d5697dacc474e010b94125e659d30b8c17f3c03be36a"
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
