class Worklease < Formula
  desc "Coordinate task and resource leases across local workers"
  homepage "https://github.com/brettinternet/worklease"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/brettinternet/worklease/releases/download/v1.9.0/worklease-v1.9.0-macos-arm64.tar.gz"
      sha256 "f693aaebabfcd4a6411ed52767ec7aa6b0b9cbbff36e8a9ec7192fd880aa1198"
    end
    on_intel do
      url "https://github.com/brettinternet/worklease/releases/download/v1.9.0/worklease-v1.9.0-macos-x64.tar.gz"
      sha256 "e9c84637181d590b22bb55c508153979a3104b13e4b0ba90ed14d8cb102260d9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/brettinternet/worklease/releases/download/v1.9.0/worklease-v1.9.0-linux-arm64.tar.gz"
      sha256 "471742a81cd488b8313aa55d7b07ea6ec26b1cbf870cd20bf619c2d8e2d0f810"
    end
    on_intel do
      url "https://github.com/brettinternet/worklease/releases/download/v1.9.0/worklease-v1.9.0-linux-x64.tar.gz"
      sha256 "cf1de8ef163c63abeccb4ca58de5664d93878a5101b303d9addc95fb67e70a53"
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
