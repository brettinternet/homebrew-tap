class Hum < Formula
  desc "Local development process supervisor"
  homepage "https://github.com/brettinternet/hum"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/brettinternet/hum/releases/download/v0.12.2/hum-0.12.2-macos-arm64.tar.gz"
      sha256 "e0dbc2ad3d5634c9c09ac4cb61676e36a2793486ecfdf3f92ff87682098912de"
    end
    on_intel do
      url "https://github.com/brettinternet/hum/releases/download/v0.12.2/hum-0.12.2-macos-x64.tar.gz"
      sha256 "17ed560531a48e57f93acbc4426b5a8f7b7048bdc3cf81ce5e7146c0223a9b00"
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
