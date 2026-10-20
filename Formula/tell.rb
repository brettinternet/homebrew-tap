class Tell < Formula
  desc "Send one notification to a person or message to an agent"
  homepage "https://github.com/brettinternet/tell"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/brettinternet/tell/releases/download/v0.5.0/tell-v0.5.0-macos-arm64.tar.gz"
      sha256 "032ee492b4252788e50e9111a3b70faedbfa335f049889e1066d15ae7b6a5bfe"
    end
    on_intel do
      url "https://github.com/brettinternet/tell/releases/download/v0.5.0/tell-v0.5.0-macos-x64.tar.gz"
      sha256 "c1e9e10701030f737b09eb81ad6e95d0995c5eac617f6e8e75b88cf21dcd2bce"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/brettinternet/tell/releases/download/v0.5.0/tell-v0.5.0-linux-arm64.tar.gz"
      sha256 "04a3b7aadf9d69409ceb48c8234c9589e2cf953954e1afebc2a510fff5b03152"
    end
    on_intel do
      url "https://github.com/brettinternet/tell/releases/download/v0.5.0/tell-v0.5.0-linux-x64.tar.gz"
      sha256 "ad99fb2152f8f212b3d4f095494b4c24ed3997918ae908c8dc6ecc72906ebf63"
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
