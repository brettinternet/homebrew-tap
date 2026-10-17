class Tell < Formula
  desc "Send one notification to a person or message to an agent"
  homepage "https://github.com/brettinternet/tell"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/brettinternet/tell/releases/download/v0.2.1/tell-v0.2.1-macos-arm64.tar.gz"
      sha256 "6dedd93d467abb1ce15a71759772d2380a8b0688b9f222981f686f7df840d523"
    end
    on_intel do
      url "https://github.com/brettinternet/tell/releases/download/v0.2.1/tell-v0.2.1-macos-x64.tar.gz"
      sha256 "f6a73d3655db0e167a6b69c2e9bda90249c03d9833eb832af8a3717e01bcc2ee"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/brettinternet/tell/releases/download/v0.2.1/tell-v0.2.1-linux-arm64.tar.gz"
      sha256 "8fbdaf7b6a0e421a5d492a2a6b24404106891c665983e581edaafe08b0320dcb"
    end
    on_intel do
      url "https://github.com/brettinternet/tell/releases/download/v0.2.1/tell-v0.2.1-linux-x64.tar.gz"
      sha256 "e6bc5488b00efd067b205a78e45cde85cca4eb3bc9b3734b36e0a3760d4b444c"
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
