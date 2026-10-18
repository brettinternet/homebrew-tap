class Tell < Formula
  desc "Send one notification to a person or message to an agent"
  homepage "https://github.com/brettinternet/tell"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/brettinternet/tell/releases/download/v0.4.0/tell-v0.4.0-macos-arm64.tar.gz"
      sha256 "837ba57c971ebaf4714f3fe30d53829cc89eb493d1a1121a43f487341dc15a29"
    end
    on_intel do
      url "https://github.com/brettinternet/tell/releases/download/v0.4.0/tell-v0.4.0-macos-x64.tar.gz"
      sha256 "76f06a2f8de658560995cb17a1debc81d44f847c920d38e754f65d0cde668afa"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/brettinternet/tell/releases/download/v0.4.0/tell-v0.4.0-linux-arm64.tar.gz"
      sha256 "1650911bca73a503f6ab79b2f5a4a75b9a3e1965873168df019541262bc48d00"
    end
    on_intel do
      url "https://github.com/brettinternet/tell/releases/download/v0.4.0/tell-v0.4.0-linux-x64.tar.gz"
      sha256 "1c636afde54ec337e5a08779127cfa8b921cdcf5f6879d4eed5d5cfe96dd24df"
    end
  end

  def install
    # Homebrew strips the archive's single top-level bin directory.
    bin.install "tell"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tell --version")
  end
end
