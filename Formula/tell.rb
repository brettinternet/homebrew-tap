class Tell < Formula
  desc "Send one notification to a person or message to an agent"
  homepage "https://github.com/brettinternet/tell"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/brettinternet/tell/releases/download/v0.9.0/tell-v0.9.0-macos-arm64.tar.gz"
      sha256 "c3e6bb7494c4196928f605342377561c9baf0c8bedbfc4f1969ec85c67163fe5"
    end
    on_intel do
      url "https://github.com/brettinternet/tell/releases/download/v0.9.0/tell-v0.9.0-macos-x64.tar.gz"
      sha256 "e45f609531b0edca05a8db881ed008403ef20f1dfacffb7c87a46b2febe7834c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/brettinternet/tell/releases/download/v0.9.0/tell-v0.9.0-linux-arm64.tar.gz"
      sha256 "5fed670f787f06a0dca37d9fc39b6d16f0f13366128bf569d8094cdfebfd1a4c"
    end
    on_intel do
      url "https://github.com/brettinternet/tell/releases/download/v0.9.0/tell-v0.9.0-linux-x64.tar.gz"
      sha256 "df96719ebbf1c35d348256d86eae7bcef41a879f80f2248683bb7b5ce1a7f0d4"
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
