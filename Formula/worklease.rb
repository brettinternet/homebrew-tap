class Worklease < Formula
  desc "Coordinate task and resource leases across local workers"
  homepage "https://github.com/brettinternet/worklease"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/brettinternet/worklease/releases/download/v1.9.3/worklease-v1.9.3-macos-arm64.tar.gz"
      sha256 "37aac81a94d7b2c6c72a9e0265776cb65af2155deacdc6fb058c86db99a7c85b"
    end
    on_intel do
      url "https://github.com/brettinternet/worklease/releases/download/v1.9.3/worklease-v1.9.3-macos-x64.tar.gz"
      sha256 "41432d942b3cf6f0b1522c0695e521b05fa202d5d197da795d49164dad36da1b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/brettinternet/worklease/releases/download/v1.9.3/worklease-v1.9.3-linux-arm64.tar.gz"
      sha256 "262962160cb24fea54855a9096a5bdd3c0fa6b66437057e2e51cdaab462a2928"
    end
    on_intel do
      url "https://github.com/brettinternet/worklease/releases/download/v1.9.3/worklease-v1.9.3-linux-x64.tar.gz"
      sha256 "830d38bfc1354f0008e29619e683ee5105e23e791184a22e67b059c8825d3ee8"
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
