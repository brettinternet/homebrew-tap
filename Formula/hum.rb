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

  def install
    bin.install "hum"
    man1.install "hum.1"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/hum --version")
  end
end
