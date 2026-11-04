class Hum < Formula
  desc "Local development process supervisor"
  homepage "https://github.com/brettinternet/hum"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/brettinternet/hum/releases/download/v0.19.0/hum-0.19.0-macos-arm64.tar.gz"
      sha256 "582ba519811818e67bf88f3542bf09565d6a6ffdc62d5ad103125056b3c24009"
    end
    on_intel do
      url "https://github.com/brettinternet/hum/releases/download/v0.19.0/hum-0.19.0-macos-x64.tar.gz"
      sha256 "eaea34c21ef84f48fb88077dd0e956f55bb04fead4448c5bc48a8a4218275460"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/brettinternet/hum/releases/download/v0.19.0/hum-0.19.0-linux-arm64.tar.gz"
      sha256 "17acb5935bf163e11eb74f8026112a287e9856dfd76d15288340ca0c5d06b1d3"
    end
    on_intel do
      url "https://github.com/brettinternet/hum/releases/download/v0.19.0/hum-0.19.0-linux-x64.tar.gz"
      sha256 "288a9b2bdc2ee566ef6cc5b20d61f7e06b06ef8aee6c8c86ba3c0c6f1f1a54f9"
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
