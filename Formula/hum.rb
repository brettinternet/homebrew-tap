class Hum < Formula
  desc "Local development process supervisor"
  homepage "https://github.com/brettinternet/hum"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/brettinternet/hum/releases/download/v0.15.0/hum-0.15.0-macos-arm64.tar.gz"
      sha256 "bc3a7d5c297625db1555cc9271d7a32b130a524652529f669d7aa655bdd1f99a"
    end
    on_intel do
      url "https://github.com/brettinternet/hum/releases/download/v0.15.0/hum-0.15.0-macos-x64.tar.gz"
      sha256 "abbc19080132dbd21ccadf1894224840dd4d56d76c1e4dce9673000c351a73a3"
    end
  end

  def install
    bin.install "hum"
    man1.install "hum.1"
  end

  test do
    assert_match "hum version #{version}", shell_output("#{bin}/hum --version")
  end
end
