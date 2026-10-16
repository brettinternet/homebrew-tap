class Tell < Formula
  desc "Send one notification to a person or message to an agent"
  homepage "https://github.com/brettinternet/tell"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/brettinternet/tell/releases/download/v0.1.0/tell-v0.1.0-macos-arm64.tar.gz"
      sha256 "ae589ebccffe326ed719b02d7dc3146000aa4701b16df4876214826ff3a9a251"
    end
    on_intel do
      url "https://github.com/brettinternet/tell/releases/download/v0.1.0/tell-v0.1.0-macos-x64.tar.gz"
      sha256 "7929315ee47a38e3230fcffa5360222546079f695cad70df1df26f9b9e01d631"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/brettinternet/tell/releases/download/v0.1.0/tell-v0.1.0-linux-arm64.tar.gz"
      sha256 "9a919949848a5b2783bfa863d8011ed9dc8f1d7c224e5dc64b76b7c1a86f26a6"
    end
    on_intel do
      url "https://github.com/brettinternet/tell/releases/download/v0.1.0/tell-v0.1.0-linux-x64.tar.gz"
      sha256 "777313c723eb283d623f28d7069ee630621166b6714af0fc4c08f531da1c099c"
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
