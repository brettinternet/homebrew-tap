class Hum < Formula
  desc "Local development process supervisor"
  homepage "https://github.com/brettinternet/hum"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/brettinternet/hum/releases/download/v0.10.0/hum-0.10.0-macos-arm64.tar.gz"
      sha256 "5db5534c61e845f6825b9d703997fb3c2be3abf7c46a0db291564fbd91ad9841"
    end
    on_intel do
      url "https://github.com/brettinternet/hum/releases/download/v0.10.0/hum-0.10.0-macos-x64.tar.gz"
      sha256 "084d9ed37639c885362f55b72192e170732d1c703150de190c0bbe93280e5097"
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
