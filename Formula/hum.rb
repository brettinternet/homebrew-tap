class Hum < Formula
  desc "Local development process supervisor"
  homepage "https://github.com/brettinternet/hum"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/brettinternet/hum/releases/download/v0.17.1/hum-0.17.1-macos-arm64.tar.gz"
      sha256 "cbad2a57a3323317bfab6fd630c74ed8575676a343db18046bd7983c43635258"
    end
    on_intel do
      url "https://github.com/brettinternet/hum/releases/download/v0.17.1/hum-0.17.1-macos-x64.tar.gz"
      sha256 "3b12cdb1fe4415420352982bb804b8192342572754416b3b7b3289045e3f93c1"
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
