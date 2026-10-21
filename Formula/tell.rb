class Tell < Formula
  desc "Send one notification to a person or message to an agent"
  homepage "https://github.com/brettinternet/tell"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/brettinternet/tell/releases/download/v0.5.1/tell-v0.5.1-macos-arm64.tar.gz"
      sha256 "a259b1858c34396407a45cc9a39db5e613d023d97042779a9e3508685c4cc246"
    end
    on_intel do
      url "https://github.com/brettinternet/tell/releases/download/v0.5.1/tell-v0.5.1-macos-x64.tar.gz"
      sha256 "c21cd67a3c99132f6c91cbb410a11c07c3fa4404a2cffab06fc749b40b91e73e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/brettinternet/tell/releases/download/v0.5.1/tell-v0.5.1-linux-arm64.tar.gz"
      sha256 "13a538238a0165c89247c9f4f2dd82409c11a1c41ddd763cfe5a55fc53aec386"
    end
    on_intel do
      url "https://github.com/brettinternet/tell/releases/download/v0.5.1/tell-v0.5.1-linux-x64.tar.gz"
      sha256 "f9c18db4a0595b5d80cbcb8d326dab82495555ccf752dcf421fcdd54379426b4"
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
