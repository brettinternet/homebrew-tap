class Worklease < Formula
  desc "Coordinate task and resource leases across local workers"
  homepage "https://github.com/brettinternet/worklease"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/brettinternet/worklease/releases/download/v1.10.0/worklease-v1.10.0-macos-arm64.tar.gz"
      sha256 "e15977cd4ce1ce20f5f8c9fbe855ed254fbae220dd10df5e1418a505bd9d2813"
    end
    on_intel do
      url "https://github.com/brettinternet/worklease/releases/download/v1.10.0/worklease-v1.10.0-macos-x64.tar.gz"
      sha256 "7acca88c3fffda828e31b9fca3d7f4c759ccc392176a83829bc3bcc92bae1145"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/brettinternet/worklease/releases/download/v1.10.0/worklease-v1.10.0-linux-arm64.tar.gz"
      sha256 "b4d6714835f23b4720417f08c29f656e4f113ad6cba5833052b3ca5f5c3fb7f0"
    end
    on_intel do
      url "https://github.com/brettinternet/worklease/releases/download/v1.10.0/worklease-v1.10.0-linux-x64.tar.gz"
      sha256 "db181632836cb62d0895d68edd826bfa5be4b1fe777726b4a6f45e6d811b5fb3"
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
