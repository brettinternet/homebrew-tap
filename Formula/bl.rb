class Bl < Formula
  desc "Keyboard-first terminal backlog for people and coding agents"
  homepage "https://github.com/brettinternet/backlog"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/brettinternet/backlog/releases/download/v0.12.0/bl_darwin_arm64.tar.gz"
      sha256 "4b259a963b97f348d7f9f4b9d8dfa4ab2c62d0410771758cbe144d043e805ba8"
    end
    on_intel do
      url "https://github.com/brettinternet/backlog/releases/download/v0.12.0/bl_darwin_amd64.tar.gz"
      sha256 "56b81399bfdbcd1b75a907fadbee3c282b90b2b82c85d263f9e685cc0e5010a1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/brettinternet/backlog/releases/download/v0.12.0/bl_linux_arm64.tar.gz"
      sha256 "bb9b7efb11fd47814008555ebde516b9c2c02fd055e907c8f206b8de80a0d7f9"
    end
    on_intel do
      url "https://github.com/brettinternet/backlog/releases/download/v0.12.0/bl_linux_amd64.tar.gz"
      sha256 "4cb339466722f61096d36f55b5b9b2004d5e636f4f491d99c861172fbd0fe24e"
    end
  end

  def install
    bin.install "bl"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bl --version")
  end
end
