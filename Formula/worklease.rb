class Worklease < Formula
  desc "Coordinate task and resource leases across local workers"
  homepage "https://github.com/brettinternet/worklease"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/brettinternet/worklease/releases/download/v1.7.2/worklease-v1.7.2-macos-arm64.tar.gz"
      sha256 "8416026452547d4cc5863bcd37eca33ec9edb9e902bd5ef2b9d32cd27c652fb0"
    end
    on_intel do
      url "https://github.com/brettinternet/worklease/releases/download/v1.7.2/worklease-v1.7.2-macos-x64.tar.gz"
      sha256 "c7c5bdcd9bb9af34306d9432529a3a47ee5acd10e904d927f5021242ac29f2ba"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/brettinternet/worklease/releases/download/v1.7.2/worklease-v1.7.2-linux-arm64.tar.gz"
      sha256 "edc1c812fbb17677a48303da6da328acf024cb02d9fb0712c6adf9f43d41bb43"
    end
    on_intel do
      url "https://github.com/brettinternet/worklease/releases/download/v1.7.2/worklease-v1.7.2-linux-x64.tar.gz"
      sha256 "08a69e47d50d01d4ffbe71e9b7986c144b3ebc684b4ffef5af55b4df74766f34"
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
