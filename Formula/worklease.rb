class Worklease < Formula
  desc "Coordinate task and resource leases across local workers"
  homepage "https://github.com/brettinternet/worklease"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/brettinternet/worklease/releases/download/v1.14.0/worklease-v1.14.0-macos-arm64.tar.gz"
      sha256 "1b4ab71bc3427689302f844a2808a1081e798f3e64bca45802233d30bc32a0b9"
    end
    on_intel do
      url "https://github.com/brettinternet/worklease/releases/download/v1.14.0/worklease-v1.14.0-macos-x64.tar.gz"
      sha256 "ab40e7872297605609fe875ab7047bfe33e2c07c7bac71d0b4cf28199448d39f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/brettinternet/worklease/releases/download/v1.14.0/worklease-v1.14.0-linux-arm64.tar.gz"
      sha256 "a748b4493f27812a8f9cf5df8fc3c4b80cc68fa24813924b7bc0ef30bbe5a8ec"
    end
    on_intel do
      url "https://github.com/brettinternet/worklease/releases/download/v1.14.0/worklease-v1.14.0-linux-x64.tar.gz"
      sha256 "a25d31d5b21a9a077fe29384efb0d784b9a3ed3aee4bf17e51b9b72bafb67f1b"
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
