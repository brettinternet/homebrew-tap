class Worklease < Formula
  desc "Coordinate task and resource leases across local workers"
  homepage "https://github.com/brettinternet/worklease"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/brettinternet/worklease/releases/download/v1.2.0/worklease-v1.2.0-macos-arm64.tar.gz"
      sha256 "cb3cb11fcdfafc432cd8306801b9a024bf7d74b87d759e4828478117f61088e2"
    end
    on_intel do
      url "https://github.com/brettinternet/worklease/releases/download/v1.2.0/worklease-v1.2.0-macos-x64.tar.gz"
      sha256 "5c92141bc73dce3fb05453b98cacc719266e02be5381182ea6728981cd912f97"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/brettinternet/worklease/releases/download/v1.2.0/worklease-v1.2.0-linux-arm64.tar.gz"
      sha256 "715482446e2bac00e62ee7ed62e55ac87ef1c13700d01c5c94c6965b152a86fa"
    end
    on_intel do
      url "https://github.com/brettinternet/worklease/releases/download/v1.2.0/worklease-v1.2.0-linux-x64.tar.gz"
      sha256 "ceabee08ef72be7a594d3019744cf2cf014e73cc7a99a777d21dd16811585256"
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
