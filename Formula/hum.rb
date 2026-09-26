class Hum < Formula
  desc "Local development process supervisor"
  homepage "https://github.com/brettinternet/hum"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/brettinternet/hum/releases/download/v0.16.0/hum-0.16.0-macos-arm64.tar.gz"
      sha256 "de71d78dae66bf464211a0099fc5cd949c93d047f3c5b202551495c528694eb8"
    end
    on_intel do
      url "https://github.com/brettinternet/hum/releases/download/v0.16.0/hum-0.16.0-macos-x64.tar.gz"
      sha256 "8662486bb9352f1dbb1cbfa2d26221a022664a373e6c77971144545a06e7283b"
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
