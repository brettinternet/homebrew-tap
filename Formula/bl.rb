class Bl < Formula
  desc "Keyboard-first terminal backlog for people and coding agents"
  homepage "https://github.com/brettinternet/backlog"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/brettinternet/backlog/releases/download/v0.13.5/bl_darwin_arm64.tar.gz"
      sha256 "201423656bb0e1a3ae6e65028e4658b6c1241356f80a68da574951a8913482b4"
    end
    on_intel do
      url "https://github.com/brettinternet/backlog/releases/download/v0.13.5/bl_darwin_amd64.tar.gz"
      sha256 "188f7c327632c9c3a6c56772bf0fa9633c5c523a053e9cb9c000273239adea72"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/brettinternet/backlog/releases/download/v0.13.5/bl_linux_arm64.tar.gz"
      sha256 "79a20a14959e8bc88a810cde3e9e8b00bcc839a932e2943b0f0fc2cb850c029d"
    end
    on_intel do
      url "https://github.com/brettinternet/backlog/releases/download/v0.13.5/bl_linux_amd64.tar.gz"
      sha256 "ea29c686d3c43218e1d32d96747007b8e873b14e7c18cf6fffc6a214c2a0cdb4"
    end
  end

  def install
    bin.install "bl"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bl --version")
  end
end
