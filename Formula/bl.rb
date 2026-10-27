class Bl < Formula
  desc "Keyboard-first terminal backlog for people and coding agents"
  homepage "https://github.com/brettinternet/backlog"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/brettinternet/backlog/releases/download/v0.6.2/bl_darwin_arm64.tar.gz"
      sha256 "3d10cfbc57b548324c57b657be2ed8adc0d4375c003d99e04dc087feb7eab8a3"
    end
    on_intel do
      url "https://github.com/brettinternet/backlog/releases/download/v0.6.2/bl_darwin_amd64.tar.gz"
      sha256 "e1290f677acff083dbaeb6b575caa5b9574e80c93e8d3b23cbce28be1d2241f5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/brettinternet/backlog/releases/download/v0.6.2/bl_linux_arm64.tar.gz"
      sha256 "9adf1c1f5bc86853fbb92ff49f9279b38807c14f7d75f662035377a30bd419c3"
    end
    on_intel do
      url "https://github.com/brettinternet/backlog/releases/download/v0.6.2/bl_linux_amd64.tar.gz"
      sha256 "b73acf4d23a7527e0792cf3c2b5aef8d527b4fe26c2f8ae006ffe085ff173e82"
    end
  end

  def install
    bin.install "bl"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bl --version")
  end
end
