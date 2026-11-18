class Bl < Formula
  desc "Keyboard-first terminal backlog for people and coding agents"
  homepage "https://github.com/brettinternet/backlog"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/brettinternet/backlog/releases/download/v0.16.1/bl_darwin_arm64.tar.gz"
      sha256 "69c2e9763580c11abfd1d91da87ed474501856c28a26c4d59fba625a90d8db51"
    end
    on_intel do
      url "https://github.com/brettinternet/backlog/releases/download/v0.16.1/bl_darwin_amd64.tar.gz"
      sha256 "de45d77bfdc062e5b34081409100109f4e3b608f55d841e30fa768f8453cc402"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/brettinternet/backlog/releases/download/v0.16.1/bl_linux_arm64.tar.gz"
      sha256 "dc967edd322522042f29e287fcc449ca422b7f54d70b80b6332340c85cb4e1f5"
    end
    on_intel do
      url "https://github.com/brettinternet/backlog/releases/download/v0.16.1/bl_linux_amd64.tar.gz"
      sha256 "644aaa9cd034c30eb58b3b9c1dcb191adbf9f6d5de2dcbb7487d753e6cbba6ec"
    end
  end

  def install
    bin.install "bl"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bl --version")
  end
end
