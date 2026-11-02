class Noon < Formula
  desc "Local-first repository job scheduler"
  homepage "https://github.com/brettinternet/noon"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/brettinternet/noon/releases/download/v0.16.0/noon-v0.16.0-macos-arm64.tar.gz"
      sha256 "05de84b6432b00b17be2698b2378e0cc495ed2c8e891bb966d0fcdb9567ce069"
    end
    on_intel do
      url "https://github.com/brettinternet/noon/releases/download/v0.16.0/noon-v0.16.0-macos-x64.tar.gz"
      sha256 "8abcf33078377f6221b7d2b3953d80f366037e99dfbc77956be7d1d3a8c09a07"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/brettinternet/noon/releases/download/v0.16.0/noon-v0.16.0-linux-arm64.tar.gz"
      sha256 "5eb2585ae31ef42380474c6b58b650caf31cf649d7aa2627953cceababd3d624"
    end
    on_intel do
      url "https://github.com/brettinternet/noon/releases/download/v0.16.0/noon-v0.16.0-linux-x64.tar.gz"
      sha256 "caea95515307c74af552cb484eeb2b1efb61bd0eac9e6937e558b0cb6d4fc49b"
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
