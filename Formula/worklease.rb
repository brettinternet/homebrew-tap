class Worklease < Formula
  desc "Coordinate task and resource leases across local workers"
  homepage "https://github.com/brettinternet/worklease"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/brettinternet/worklease/releases/download/v1.6.1/worklease-v1.6.1-macos-arm64.tar.gz"
      sha256 "c6c9117e04f667c253894ac61c5783a45b649ba91dd4b6f8d7f6b5804e056b20"
    end
    on_intel do
      url "https://github.com/brettinternet/worklease/releases/download/v1.6.1/worklease-v1.6.1-macos-x64.tar.gz"
      sha256 "fb422a3dc7582d82468a6eba03acc8e36b3e8d5d7db0e72d01668b1b931ff6bb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/brettinternet/worklease/releases/download/v1.6.1/worklease-v1.6.1-linux-arm64.tar.gz"
      sha256 "d75363e85fadc98e3168d1560bd22593dd365ceee90637c64b30ce41c3b40649"
    end
    on_intel do
      url "https://github.com/brettinternet/worklease/releases/download/v1.6.1/worklease-v1.6.1-linux-x64.tar.gz"
      sha256 "24b18d717e5ea6dd27451e8451f85d2e6fa4f30bd09bf176687eaf4e6a1a3066"
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
