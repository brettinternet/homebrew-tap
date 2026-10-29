class Bl < Formula
  desc "Keyboard-first terminal backlog for people and coding agents"
  homepage "https://github.com/brettinternet/backlog"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/brettinternet/backlog/releases/download/v0.11.1/bl_darwin_arm64.tar.gz"
      sha256 "5540c990c8c677739352f246743c462778608a22228b5852436da4837294f39b"
    end
    on_intel do
      url "https://github.com/brettinternet/backlog/releases/download/v0.11.1/bl_darwin_amd64.tar.gz"
      sha256 "eeff5ff4a00b866310a081ccb6f05ff8fcdcb1dba498dccf55cc1b210b2df3b6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/brettinternet/backlog/releases/download/v0.11.1/bl_linux_arm64.tar.gz"
      sha256 "d7393c3c483df82105bcf7efeae38481cc420543d97798c6e8d1ac1420581b3b"
    end
    on_intel do
      url "https://github.com/brettinternet/backlog/releases/download/v0.11.1/bl_linux_amd64.tar.gz"
      sha256 "87683967107953666a0722b0bb277a0c64ade80169423f892331ad54b49ee794"
    end
  end

  def install
    bin.install "bl"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bl --version")
  end
end
