class Hum < Formula
  desc "Local development process supervisor"
  homepage "https://github.com/brettinternet/hum"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/brettinternet/hum/releases/download/v0.10.1/hum-0.10.1-macos-arm64.tar.gz"
      sha256 "dc3f060838de2ae2a4d8e85cf4be1ed729b6e7dd1f8fcfa6c7e3c3afe58b13cf"
    end
    on_intel do
      url "https://github.com/brettinternet/hum/releases/download/v0.10.1/hum-0.10.1-macos-x64.tar.gz"
      sha256 "a1c69525c8d06f6d9c92e3c54bd2990277a38344f94401554f416ca2d3a8efa7"
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
