class Hum < Formula
  desc "Local development process supervisor"
  homepage "https://github.com/brettinternet/hum"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/brettinternet/hum/releases/download/v0.18.3/hum-0.18.3-macos-arm64.tar.gz"
      sha256 "75e6c0a866ebe3e9e89dae0f9cecec4a1ba6da051865acc5bb601b47d61c1d21"
    end
    on_intel do
      url "https://github.com/brettinternet/hum/releases/download/v0.18.3/hum-0.18.3-macos-x64.tar.gz"
      sha256 "1ec2014338339289fbf547e3dcedeb41441c1081e24c33f4818357cccc0361a0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/brettinternet/hum/releases/download/v0.18.3/hum-0.18.3-linux-arm64.tar.gz"
      sha256 "d9665f533d42b5650f184e3e0a7c8033acd2abbff8e3edaa79b6f09fdc48626c"
    end
    on_intel do
      url "https://github.com/brettinternet/hum/releases/download/v0.18.3/hum-0.18.3-linux-x64.tar.gz"
      sha256 "ebc8d6ac815bea0e775078d162f74343e2f49e75805649d80ff39b43fe9ea77e"
    end
  end

  def install
    bin.install "hum"
    man1.install "hum.1"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/hum --version")
  end
end
