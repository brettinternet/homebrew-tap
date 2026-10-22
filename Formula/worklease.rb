class Worklease < Formula
  desc "Coordinate task and resource leases across local workers"
  homepage "https://github.com/brettinternet/worklease"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/brettinternet/worklease/releases/download/v1.10.1/worklease-v1.10.1-macos-arm64.tar.gz"
      sha256 "753349fb819b7c05fd6a0d000ad960c31d4f5213161255320c87b893339fcf57"
    end
    on_intel do
      url "https://github.com/brettinternet/worklease/releases/download/v1.10.1/worklease-v1.10.1-macos-x64.tar.gz"
      sha256 "ae5206da1211b0e0e9f995779f6c1425d1318ba1b69b6390485262bd6308b63d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/brettinternet/worklease/releases/download/v1.10.1/worklease-v1.10.1-linux-arm64.tar.gz"
      sha256 "ff89742a2bb9c5000ee64ce4aaf2be93eefd55a0c85d55a11aa3ee0f7cc39d8c"
    end
    on_intel do
      url "https://github.com/brettinternet/worklease/releases/download/v1.10.1/worklease-v1.10.1-linux-x64.tar.gz"
      sha256 "ab6ea422b7199f51e9a682d71b9313d254ca2da4c6c1485cc550f063f701cb2f"
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
