class Worklease < Formula
  desc "Coordinate task and resource leases across local workers"
  homepage "https://github.com/brettinternet/worklease"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/brettinternet/worklease/releases/download/v1.6.0/worklease-v1.6.0-macos-arm64.tar.gz"
      sha256 "ace6c7f00c897735d2618d52b3be90c7a8ce87bad07d3b3f1f5c03f40b0f1c0a"
    end
    on_intel do
      url "https://github.com/brettinternet/worklease/releases/download/v1.6.0/worklease-v1.6.0-macos-x64.tar.gz"
      sha256 "94fbd57e14b6d4f88cd46e459f905e16891046d29914f0fa5ac1d22668df4def"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/brettinternet/worklease/releases/download/v1.6.0/worklease-v1.6.0-linux-arm64.tar.gz"
      sha256 "f973e49ac2337c2aa704de9ea4659702e50303a928ca226e5154865ae7b921c1"
    end
    on_intel do
      url "https://github.com/brettinternet/worklease/releases/download/v1.6.0/worklease-v1.6.0-linux-x64.tar.gz"
      sha256 "296ee01f089d005fa77fc0f19a9d16f1d510b68b6d49bce70f6ea91f837860e6"
    end
  end

  def install
    bin.install "bin/worklease"
    man1.install "share/man/man1/worklease.1"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/worklease version")
  end
end
