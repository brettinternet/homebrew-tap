class Bl < Formula
  desc "Keyboard-first terminal backlog for people and coding agents"
  homepage "https://github.com/brettinternet/backlog"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/brettinternet/backlog/releases/download/v0.7.0/bl_darwin_arm64.tar.gz"
      sha256 "6e405b665482fcf1f8297895d004117f54941dfc02b7647a0919d52e0f0e7905"
    end
    on_intel do
      url "https://github.com/brettinternet/backlog/releases/download/v0.7.0/bl_darwin_amd64.tar.gz"
      sha256 "41e1ff5e4abde75d3ad879357f6fb135925bf6718ae52d6469f898f1d344255c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/brettinternet/backlog/releases/download/v0.7.0/bl_linux_arm64.tar.gz"
      sha256 "a18f0968cc050893454aeeae49e9a91fdcac899b996e3d7c5a035ed9071b8ce1"
    end
    on_intel do
      url "https://github.com/brettinternet/backlog/releases/download/v0.7.0/bl_linux_amd64.tar.gz"
      sha256 "2fcbaa6e87a8134f634b2d32cc5402139f11cbcfc7e36e8fb900f8d937633026"
    end
  end

  def install
    bin.install "bl"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bl --version")
  end
end
