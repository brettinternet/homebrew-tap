class Worklease < Formula
  desc "Coordinate task and resource leases across local workers"
  homepage "https://github.com/brettinternet/worklease"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/brettinternet/worklease/releases/download/v1.10.2/worklease-v1.10.2-macos-arm64.tar.gz"
      sha256 "24ee48bc85bbbe25e910840b6537e35c764d747f18b930046b36428213973165"
    end
    on_intel do
      url "https://github.com/brettinternet/worklease/releases/download/v1.10.2/worklease-v1.10.2-macos-x64.tar.gz"
      sha256 "42429f2e3742e6cb9138d4150fa7ac80d3b734e8d7f6c8f008e0aefe66599c28"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/brettinternet/worklease/releases/download/v1.10.2/worklease-v1.10.2-linux-arm64.tar.gz"
      sha256 "1add8a974b3e18ec59cf7c18574ce394f6aec56ad9ef6c7900d059645aafc18b"
    end
    on_intel do
      url "https://github.com/brettinternet/worklease/releases/download/v1.10.2/worklease-v1.10.2-linux-x64.tar.gz"
      sha256 "4307d03e3db8895a77f0ddbe996498fc838dab66395f5ca4ffd6b718fc0b35bf"
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
