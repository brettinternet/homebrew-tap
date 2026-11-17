class Hum < Formula
  desc "Local development process supervisor"
  homepage "https://github.com/brettinternet/hum"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/brettinternet/hum/releases/download/v0.20.1/hum-0.20.1-macos-arm64.tar.gz"
      sha256 "55171cbad0aded874a99552633623c86ec056d6e618290b102efe5572612ddad"
    end
    on_intel do
      url "https://github.com/brettinternet/hum/releases/download/v0.20.1/hum-0.20.1-macos-x64.tar.gz"
      sha256 "bdabd2fd08bee02e0a8914f5b300437df488a6bfd1b950537a6a25108b1c691c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/brettinternet/hum/releases/download/v0.20.1/hum-0.20.1-linux-arm64.tar.gz"
      sha256 "e75851dbeb203b154abfdc15d191284798d01cf6c9196b8e5fe09044766d9a84"
    end
    on_intel do
      url "https://github.com/brettinternet/hum/releases/download/v0.20.1/hum-0.20.1-linux-x64.tar.gz"
      sha256 "08736c37585d36f5eff39746adedd354da8ac02884ab118da21c9117a1f70d91"
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
