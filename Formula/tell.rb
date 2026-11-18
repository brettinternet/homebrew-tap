class Tell < Formula
  desc "Send one notification to a person or message to an agent"
  homepage "https://github.com/brettinternet/tell"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/brettinternet/tell/releases/download/v0.7.0/tell-v0.7.0-macos-arm64.tar.gz"
      sha256 "08e6a7cf99c9a90337578d563064a0839e3ff5c3c2116bf3b7ae218223b7191a"
    end
    on_intel do
      url "https://github.com/brettinternet/tell/releases/download/v0.7.0/tell-v0.7.0-macos-x64.tar.gz"
      sha256 "42ad6403b2304a6080381d0529811e3c3fff438fc4c28bfa7e00d485e2873d48"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/brettinternet/tell/releases/download/v0.7.0/tell-v0.7.0-linux-arm64.tar.gz"
      sha256 "49668ef8d2740763846206ba56b7ce59086a222c50eeb352c50a5dcd8e2269a9"
    end
    on_intel do
      url "https://github.com/brettinternet/tell/releases/download/v0.7.0/tell-v0.7.0-linux-x64.tar.gz"
      sha256 "5c3a0d0a896380a84daa68fe9273ec8f6b1df4d6a41b1bb55c3db3e736baffa7"
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
