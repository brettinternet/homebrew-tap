class Bl < Formula
  desc "Keyboard-first terminal backlog for people and coding agents"
  homepage "https://github.com/brettinternet/backlog"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/brettinternet/backlog/releases/download/v0.6.1/bl_darwin_arm64.tar.gz"
      sha256 "e87142a40e669dfe739f39a75d17eb14a73283073455ddbf6fb297ac484de259"
    end
    on_intel do
      url "https://github.com/brettinternet/backlog/releases/download/v0.6.1/bl_darwin_amd64.tar.gz"
      sha256 "4404d14949a4730eb58321669e6558095b913b9a5dfb41fcf889ae0d70eb585d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/brettinternet/backlog/releases/download/v0.6.1/bl_linux_arm64.tar.gz"
      sha256 "c6c1159db9f8021de771efcace340444ea9dd374dc187dbb17065263be1c16e1"
    end
    on_intel do
      url "https://github.com/brettinternet/backlog/releases/download/v0.6.1/bl_linux_amd64.tar.gz"
      sha256 "fa41294ab88796e35b2e5c9bf036b37f3086600e0bfeedd286b8f19e6dbe3649"
    end
  end

  def install
    bin.install "bl"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bl --version")
  end
end
