class Worklease < Formula
  desc "Coordinate task and resource leases across local workers"
  homepage "https://github.com/brettinternet/worklease"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/brettinternet/worklease/releases/download/v1.4.0/worklease-v1.4.0-macos-arm64.tar.gz"
      sha256 "9bfa7ba0a1a2d69c96ab6e5dc278436dc2a74b786f11577f860b5faf2ca4fe25"
    end
    on_intel do
      url "https://github.com/brettinternet/worklease/releases/download/v1.4.0/worklease-v1.4.0-macos-x64.tar.gz"
      sha256 "a2207f05147f6b1449c60ce371129f4edc32aca4af09e857b64917e110a9c1be"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/brettinternet/worklease/releases/download/v1.4.0/worklease-v1.4.0-linux-arm64.tar.gz"
      sha256 "7858365f2162e2b6178ccbc016fcd51815d40b146f32e114e1ba7b1c20037814"
    end
    on_intel do
      url "https://github.com/brettinternet/worklease/releases/download/v1.4.0/worklease-v1.4.0-linux-x64.tar.gz"
      sha256 "87b5580928a018722925c6a5d2a5cbd99c9d69367d5257729e52bba15f70d6be"
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
