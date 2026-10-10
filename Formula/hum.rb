class Hum < Formula
  desc "Local development process supervisor"
  homepage "https://github.com/brettinternet/hum"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/brettinternet/hum/releases/download/v0.17.0/hum-0.17.0-macos-arm64.tar.gz"
      sha256 "ed7c41852b7080290e7781e47becf70903da94b17fb982330383252cd2c033b8"
    end
    on_intel do
      url "https://github.com/brettinternet/hum/releases/download/v0.17.0/hum-0.17.0-macos-x64.tar.gz"
      sha256 "f33b0544789625e3c6596edcb55ffba6eac10cec5698ecb771e36691e24ad3c9"
    end
  end

  def install
    bin.install "hum"
    man1.install "hum.1"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/hum --version")
  end
end
