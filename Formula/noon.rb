class Noon < Formula
  desc "Local-first repository job scheduler"
  homepage "https://github.com/brettinternet/noon"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/brettinternet/noon/releases/download/v0.15.0/noon-v0.15.0-macos-arm64.tar.gz"
      sha256 "5b86e8dd6ebbdfdf78fae1224e3d53271c60eafe2f005b24045e99b9e8baa84e"
    end
    on_intel do
      url "https://github.com/brettinternet/noon/releases/download/v0.15.0/noon-v0.15.0-macos-x64.tar.gz"
      sha256 "af1dad64596555c6b8ad21335a9747eab1d647137191f78380b250cf7b41adff"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/brettinternet/noon/releases/download/v0.15.0/noon-v0.15.0-linux-arm64.tar.gz"
      sha256 "d5111776a91326c84689449cbc0ef5cacfda41591df1a40cd5733436cd299b42"
    end
    on_intel do
      url "https://github.com/brettinternet/noon/releases/download/v0.15.0/noon-v0.15.0-linux-x64.tar.gz"
      sha256 "c112da4f57a5a8d3b27a5af40d096fdd6f21e15803fbb316319894b1ddd75f4b"
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
