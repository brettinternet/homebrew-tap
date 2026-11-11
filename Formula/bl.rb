class Bl < Formula
  desc "Keyboard-first terminal backlog for people and coding agents"
  homepage "https://github.com/brettinternet/backlog"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/brettinternet/backlog/releases/download/v0.13.2/bl_darwin_arm64.tar.gz"
      sha256 "a0ab117423f8483d782e233d70588ecfc0c1d1adc9d8ceb821427474d8ee7ded"
    end
    on_intel do
      url "https://github.com/brettinternet/backlog/releases/download/v0.13.2/bl_darwin_amd64.tar.gz"
      sha256 "63fd30110e326f28cca0558054ac8cbcd90e4cac103c7b59cfb3fd89625dc139"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/brettinternet/backlog/releases/download/v0.13.2/bl_linux_arm64.tar.gz"
      sha256 "f59a0c7a19373c7b460ba298db26ec40ed9f12b16e9582cf2843740250bbfcf2"
    end
    on_intel do
      url "https://github.com/brettinternet/backlog/releases/download/v0.13.2/bl_linux_amd64.tar.gz"
      sha256 "99c8b27b76325c5941363855215bd0adbbd65ca127fdf5a23fc587f0d1d03fb1"
    end
  end

  def install
    bin.install "bl"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bl --version")
  end
end
