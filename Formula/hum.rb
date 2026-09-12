class Hum < Formula
  desc "Local development process supervisor"
  homepage "https://github.com/brettinternet/hum"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/brettinternet/hum/releases/download/v0.11.0/hum-0.11.0-macos-arm64.tar.gz"
      sha256 "c81c629310656b3254097c359afa547f1fd483e9b3b76b6c691171c937e1dbc6"
    end
    on_intel do
      url "https://github.com/brettinternet/hum/releases/download/v0.11.0/hum-0.11.0-macos-x64.tar.gz"
      sha256 "143f1872f6aab78ec9d693cdbf632623ae6afb5a7829f688b68f9c82b71046be"
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
