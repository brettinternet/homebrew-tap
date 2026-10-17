class Noon < Formula
  desc "Local-first repository job scheduler"
  homepage "https://github.com/brettinternet/noon"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/brettinternet/noon/releases/download/v0.1.0/noon-v0.1.0-macos-arm64.tar.gz"
      sha256 "1317d6894cafb0d90ec41864d7ec51173b03b5ae96387368fdaab8704f408a22"
    end
    on_intel do
      url "https://github.com/brettinternet/noon/releases/download/v0.1.0/noon-v0.1.0-macos-x64.tar.gz"
      sha256 "d30e578133f268d80a510b44c2c7dd65c73e7d141e5fe8a6ccb5eb3bc319ee40"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/brettinternet/noon/releases/download/v0.1.0/noon-v0.1.0-linux-arm64.tar.gz"
      sha256 "2303297da29c859862a7e1ae77a245cdeb5291dcd5e419226af5a4c2d5f6c1e5"
    end
    on_intel do
      url "https://github.com/brettinternet/noon/releases/download/v0.1.0/noon-v0.1.0-linux-x64.tar.gz"
      sha256 "d315863a00113c8b978c24ca033a74073519265aa6b69071d424a0ca4894f12c"
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
