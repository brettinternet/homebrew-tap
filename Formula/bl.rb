class Bl < Formula
  desc "Keyboard-first terminal backlog for people and coding agents"
  homepage "https://github.com/brettinternet/backlog"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/brettinternet/backlog/releases/download/v0.8.0/bl_darwin_arm64.tar.gz"
      sha256 "8a5d9ad773a2f865d174580ee53ab5c6af5bfd152349bff6c2d9f242d000ef99"
    end
    on_intel do
      url "https://github.com/brettinternet/backlog/releases/download/v0.8.0/bl_darwin_amd64.tar.gz"
      sha256 "47abadade1a4d9c552d84eb9580a5f76441807c62215271bd9741a453a353b55"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/brettinternet/backlog/releases/download/v0.8.0/bl_linux_arm64.tar.gz"
      sha256 "239489ba21e860b18a3c2c9af42b54c10ba020195382f144bda6de5f31eebbc8"
    end
    on_intel do
      url "https://github.com/brettinternet/backlog/releases/download/v0.8.0/bl_linux_amd64.tar.gz"
      sha256 "b5294e45ff3e1a433c54d4fcddc62df8489075318eec1edaa98400e190b4d680"
    end
  end

  def install
    bin.install "bl"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bl --version")
  end
end
