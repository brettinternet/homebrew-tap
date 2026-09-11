class Hum < Formula
  desc "Local development process supervisor"
  homepage "https://github.com/brettinternet/hum"
  version "0.9.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/brettinternet/hum/releases/download/v0.9.0/hum-0.9.0-macos-arm64.tar.gz"
      sha256 "375bfe784c25254ca26c6791799fc05452430a438ea7e617fe433d30458f75af"
    end
    on_intel do
      url "https://github.com/brettinternet/hum/releases/download/v0.9.0/hum-0.9.0-macos-x64.tar.gz"
      sha256 "307dff69d14c639b500d930cb2539a1534e71635a18fc1f2a678b54659434e4b"
    end
  end

  def install
    bin.install "hum"
  end

  test do
    assert_match "hum version #{version}", shell_output("#{bin}/hum --version")
  end
end
