class Hum < Formula
  desc "Local development process supervisor"
  homepage "https://github.com/brettinternet/hum"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/brettinternet/hum/releases/download/v0.12.1/hum-0.12.1-macos-arm64.tar.gz"
      sha256 "440fdcce5a2ff917ad03514dc37be96b8a7646d90e97f289a3e58d55d6fa1cea"
    end
    on_intel do
      url "https://github.com/brettinternet/hum/releases/download/v0.12.1/hum-0.12.1-macos-x64.tar.gz"
      sha256 "4d7c9f8efab4e5895a2a7b58e7fb08674771a2a51fa915e6f51d5ceee0f7a443"
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
