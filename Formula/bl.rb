class Bl < Formula
  desc "Keyboard-first terminal backlog for people and coding agents"
  homepage "https://github.com/brettinternet/backlog"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/brettinternet/backlog/releases/download/v0.13.1/bl_darwin_arm64.tar.gz"
      sha256 "0e07a3ba6fa7b98d78b1909ea2d181ff59d420bc9f20bc79bba699b1939e4204"
    end
    on_intel do
      url "https://github.com/brettinternet/backlog/releases/download/v0.13.1/bl_darwin_amd64.tar.gz"
      sha256 "130e0283b77923b2db6eeb1c39c51cfc3b0ec720c78f05d457e10230fed67b4c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/brettinternet/backlog/releases/download/v0.13.1/bl_linux_arm64.tar.gz"
      sha256 "1cda3df87fce23c7298e6b393039845714a6d188fb3f4f79d93c2c32a45faa52"
    end
    on_intel do
      url "https://github.com/brettinternet/backlog/releases/download/v0.13.1/bl_linux_amd64.tar.gz"
      sha256 "bab83c769b2bc300829faf47d9e019a7126f325422a27b5603e65f754223b3f7"
    end
  end

  def install
    bin.install "bl"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bl --version")
  end
end
