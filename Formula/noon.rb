class Noon < Formula
  desc "Local-first repository job scheduler"
  homepage "https://github.com/brettinternet/noon"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/brettinternet/noon/releases/download/v0.17.0/noon-v0.17.0-macos-arm64.tar.gz"
      sha256 "3b8acf7bc11ae53f34c4263f29cbbe742dfb3312ce8955ad70a78c289c88ddd5"
    end
    on_intel do
      url "https://github.com/brettinternet/noon/releases/download/v0.17.0/noon-v0.17.0-macos-x64.tar.gz"
      sha256 "f46f36c625dbc7f9310a4fb4e1989efab7443e096e0f187f6a989b032c1f859c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/brettinternet/noon/releases/download/v0.17.0/noon-v0.17.0-linux-arm64.tar.gz"
      sha256 "71f4fae5df9f34006e0f3d69e6177e07fd7269ecd3a3da61b9b94f388a538bdd"
    end
    on_intel do
      url "https://github.com/brettinternet/noon/releases/download/v0.17.0/noon-v0.17.0-linux-x64.tar.gz"
      sha256 "8dedf64cb33c1737af660d3b3de1d9307689228349e4d3ad46a1ef3fc92d9bc0"
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
