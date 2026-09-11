class Hum < Formula
  desc "Local development process supervisor"
  homepage "https://github.com/brettinternet/hum"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/brettinternet/hum/releases/download/v0.9.1/hum-0.9.1-macos-arm64.tar.gz"
      sha256 "1d6153fcf25671cb3ade8471bce1ec7aadb68822bbcb4d57ab9bfbdae90aad0a"
    end
    on_intel do
      url "https://github.com/brettinternet/hum/releases/download/v0.9.1/hum-0.9.1-macos-x64.tar.gz"
      sha256 "5beb4cebe91dfa840eba938a61eeac437b8b3ee8bbe679090e1121cfeaadcb39"
    end
  end

  def install
    bin.install "hum"
  end

  test do
    assert_match "hum version #{version}", shell_output("#{bin}/hum --version")
  end
end
