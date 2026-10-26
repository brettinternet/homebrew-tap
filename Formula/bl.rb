class Bl < Formula
  desc "Keyboard-first terminal backlog for people and coding agents"
  homepage "https://github.com/brettinternet/backlog"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/brettinternet/backlog/releases/download/v0.6.0/bl_darwin_arm64.tar.gz"
      sha256 "d8e7e81bf9237d434a9439a59afedfff010baa4208662c32037357e35b400e2d"
    end
    on_intel do
      url "https://github.com/brettinternet/backlog/releases/download/v0.6.0/bl_darwin_amd64.tar.gz"
      sha256 "524240631221cba83c9896006992403ab6e177a8afd1411b6700b4e54b2a6a24"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/brettinternet/backlog/releases/download/v0.6.0/bl_linux_arm64.tar.gz"
      sha256 "d369c1bc395d0b9300f20a003bcd9cd747bd6f1233569296ecbfe1a1185b94af"
    end
    on_intel do
      url "https://github.com/brettinternet/backlog/releases/download/v0.6.0/bl_linux_amd64.tar.gz"
      sha256 "0ca0b75a8dace32d44e6554ab51146b1456199fea93ad7ce974fb152c0b5eaa2"
    end
  end

  def install
    bin.install "bl"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bl --version")
  end
end
