class Bl < Formula
  desc "Keyboard-first terminal backlog for people and coding agents"
  homepage "https://github.com/brettinternet/backlog"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/brettinternet/backlog/releases/download/v0.13.4/bl_darwin_arm64.tar.gz"
      sha256 "d69e25b6464d06a5bb629ef1147ee1edc20dfc817dd820a37936bd9833915e92"
    end
    on_intel do
      url "https://github.com/brettinternet/backlog/releases/download/v0.13.4/bl_darwin_amd64.tar.gz"
      sha256 "0eef188908219340ab373c7fc18b3f6c8f1e5272ff4a7d588bc63388613e19ae"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/brettinternet/backlog/releases/download/v0.13.4/bl_linux_arm64.tar.gz"
      sha256 "5536ef0c0e81c89c5c3508fa72f00d46d3927de1dbbd96d734740e74fef4b1a5"
    end
    on_intel do
      url "https://github.com/brettinternet/backlog/releases/download/v0.13.4/bl_linux_amd64.tar.gz"
      sha256 "88111380693ad57b28c1fb195d6c8aa7c936d0b5e65aa0175517b4c5b6cf887c"
    end
  end

  def install
    bin.install "bl"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bl --version")
  end
end
