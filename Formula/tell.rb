class Tell < Formula
  desc "Send one notification to a person or message to an agent"
  homepage "https://github.com/brettinternet/tell"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/brettinternet/tell/releases/download/v0.3.0/tell-v0.3.0-macos-arm64.tar.gz"
      sha256 "72a2ccedb68c4bf8273804f200512b8c59775d3eee26fc53f6013825f4ce7f1b"
    end
    on_intel do
      url "https://github.com/brettinternet/tell/releases/download/v0.3.0/tell-v0.3.0-macos-x64.tar.gz"
      sha256 "77f7112f7a901532e544f3df5671474d2afd8f516caebd0638ac35d45e1970ed"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/brettinternet/tell/releases/download/v0.3.0/tell-v0.3.0-linux-arm64.tar.gz"
      sha256 "b4d598dc62cf966f33c72d86e27207ec720ae0a37db3e4d0ac45663283f2bf59"
    end
    on_intel do
      url "https://github.com/brettinternet/tell/releases/download/v0.3.0/tell-v0.3.0-linux-x64.tar.gz"
      sha256 "af4c7627c4e0df93803f5b7a0d7a78affd24397116eb6cca720df639bd8c9823"
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
