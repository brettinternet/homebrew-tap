class Noon < Formula
  desc "Local-first repository job scheduler"
  homepage "https://github.com/brettinternet/noon"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/brettinternet/noon/releases/download/v0.20.0/noon-v0.20.0-macos-arm64.tar.gz"
      sha256 "dcb174253250f354a8897fb52e49db15d527eede66b3be9fc29397c464d3dedd"
    end
    on_intel do
      url "https://github.com/brettinternet/noon/releases/download/v0.20.0/noon-v0.20.0-macos-x64.tar.gz"
      sha256 "f9559cceda888b1fab96a5de42782a6c504ff9d4e3ff17e258ad73bbd4e6a97a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/brettinternet/noon/releases/download/v0.20.0/noon-v0.20.0-linux-arm64.tar.gz"
      sha256 "6701bea3aded72eafa72cb26f6f30f9272827502b814d62694b09b29587f80c0"
    end
    on_intel do
      url "https://github.com/brettinternet/noon/releases/download/v0.20.0/noon-v0.20.0-linux-x64.tar.gz"
      sha256 "e265445d04fcc105ae2f04ed173304fbecf987ca08f7dd1732fe3b40cf99c864"
    end
  end

  def install
    # Homebrew strips the archive's single top-level bin directory.
    bin.install "noon"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/noon --version")

    home = testpath/"home"
    config = testpath/"config"
    state = testpath/"noon-state"
    home.mkpath
    config.mkpath
    ENV["HOME"] = home.to_s
    ENV["XDG_CONFIG_HOME"] = config.to_s
    ENV["XDG_STATE_HOME"] = (testpath/"xdg-state").to_s
    ENV["NOON_STATE_DIR"] = state.to_s
    project = testpath/"project"
    project.mkpath
    (project/"noon.yaml").write <<~YAML
      version: 1
      jobs:
        homebrew-smoke:
          schedule: every day at 2am
          run: [sh, -c, "printf ran > homebrew-smoke-job-ran"]
    YAML
    ENV["NOON_PROJECT"] = project.to_s
    system bin/"noon"
    refute((project/"homebrew-smoke-job-ran").exist?)
    refute(state.exist?)
    refute((home/"Library/LaunchAgents/io.github.brettinternet.noon.plist").exist?)
    refute((config/"systemd/user/noon.service").exist?)
  end
end
