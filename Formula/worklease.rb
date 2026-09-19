class Worklease < Formula
  desc "Coordinate task and resource leases across local workers"
  homepage "https://github.com/brettinternet/worklease"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/brettinternet/worklease/releases/download/v1.7.3/worklease-v1.7.3-macos-arm64.tar.gz"
      sha256 "01c2500183866f421df239bd808eb8831fbb09237704f943a021ea7e6cfcc198"
    end
    on_intel do
      url "https://github.com/brettinternet/worklease/releases/download/v1.7.3/worklease-v1.7.3-macos-x64.tar.gz"
      sha256 "52b73c120abf53e32e28024083e18e3521d3720a0d779c4333c8ca63ec3ba0e9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/brettinternet/worklease/releases/download/v1.7.3/worklease-v1.7.3-linux-arm64.tar.gz"
      sha256 "59211ffe2e3ecae08b74e252c3cf4557a24406afa492a78a62fa82f7fc92d88d"
    end
    on_intel do
      url "https://github.com/brettinternet/worklease/releases/download/v1.7.3/worklease-v1.7.3-linux-x64.tar.gz"
      sha256 "3119408910509de41f61a6012513dc416982c3cc76380a18a4487eb0ea0aa2d4"
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
