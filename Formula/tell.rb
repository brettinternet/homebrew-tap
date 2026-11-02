class Tell < Formula
  desc "Send one notification to a person or message to an agent"
  homepage "https://github.com/brettinternet/tell"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/brettinternet/tell/releases/download/v0.6.0/tell-v0.6.0-macos-arm64.tar.gz"
      sha256 "c3d7acf28c3513ce52667c186da8a9eaaff8c6c9572cc97c873280cfce15d2bf"
    end
    on_intel do
      url "https://github.com/brettinternet/tell/releases/download/v0.6.0/tell-v0.6.0-macos-x64.tar.gz"
      sha256 "0ab30614f2ac157b258de0708e83bdbba3acb103f922c375d73814d16af57fba"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/brettinternet/tell/releases/download/v0.6.0/tell-v0.6.0-linux-arm64.tar.gz"
      sha256 "4548c393ab93371d499b2c82b5ac0d7fe607a5840a126d48c45bf1713ff6f9fe"
    end
    on_intel do
      url "https://github.com/brettinternet/tell/releases/download/v0.6.0/tell-v0.6.0-linux-x64.tar.gz"
      sha256 "74652b8b6cdd734824fc9d326845db8e8f73cd47e6ba59ed3aa0835bddabc263"
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
