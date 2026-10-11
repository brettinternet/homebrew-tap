class Worklease < Formula
  desc "Coordinate task and resource leases across local workers"
  homepage "https://github.com/brettinternet/worklease"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/brettinternet/worklease/releases/download/v1.9.1/worklease-v1.9.1-macos-arm64.tar.gz"
      sha256 "c1f38a889eddaf59969ee20aa38094c4fbb71904118ea2bbb40a1ea80d1ec54a"
    end
    on_intel do
      url "https://github.com/brettinternet/worklease/releases/download/v1.9.1/worklease-v1.9.1-macos-x64.tar.gz"
      sha256 "ebf6fc100efcae8787ecbd5205d59bd9964990be31841ce29d506c0c80868631"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/brettinternet/worklease/releases/download/v1.9.1/worklease-v1.9.1-linux-arm64.tar.gz"
      sha256 "c77dfc03d934e25af5ab66a71ef45177a326439b6c0c697091a819541e768ccf"
    end
    on_intel do
      url "https://github.com/brettinternet/worklease/releases/download/v1.9.1/worklease-v1.9.1-linux-x64.tar.gz"
      sha256 "7016b37df9b3cc4be728255a5a3699af8acf0b231fec6b0ab192817ec61892f4"
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
