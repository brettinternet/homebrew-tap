class Bl < Formula
  desc "Keyboard-first terminal backlog for people and coding agents"
  homepage "https://github.com/brettinternet/backlog"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/brettinternet/backlog/releases/download/v0.9.0/bl_darwin_arm64.tar.gz"
      sha256 "3bd4cb6691ecd821d2d9ddfa3f1b9fb223bd940a6a8bd087e2bfab7bf2ca8be2"
    end
    on_intel do
      url "https://github.com/brettinternet/backlog/releases/download/v0.9.0/bl_darwin_amd64.tar.gz"
      sha256 "f7598b04f0c98dc040ae515600933c03734758d5bf09ac4df75c242cdc7e6668"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/brettinternet/backlog/releases/download/v0.9.0/bl_linux_arm64.tar.gz"
      sha256 "65a237049d9c362834d4e4a0a9a29a380b9de8cbe2f63a03e8757eeaef07e39b"
    end
    on_intel do
      url "https://github.com/brettinternet/backlog/releases/download/v0.9.0/bl_linux_amd64.tar.gz"
      sha256 "fba0fedcc43b996ff88a8ba3e47b4a3aa8d6109c294a3d19b73c0d70692e2f11"
    end
  end

  def install
    bin.install "bl"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bl --version")
  end
end
