class Noon < Formula
  desc "Local-first repository job scheduler"
  homepage "https://github.com/brettinternet/noon"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/brettinternet/noon/releases/download/v0.19.0/noon-v0.19.0-macos-arm64.tar.gz"
      sha256 "32b79bc7ccc722b9bc1c40c21000c9b6013e317fe2f440e3ca16c8b65aa96bef"
    end
    on_intel do
      url "https://github.com/brettinternet/noon/releases/download/v0.19.0/noon-v0.19.0-macos-x64.tar.gz"
      sha256 "d76eb1e54f6ec4ea743673440a1074eba364c840234c6e5fbeab8e4e8f41f279"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/brettinternet/noon/releases/download/v0.19.0/noon-v0.19.0-linux-arm64.tar.gz"
      sha256 "7701a842fd8ee487613a6d45cc51e449c15e3306681c0aa271d8628406b498c5"
    end
    on_intel do
      url "https://github.com/brettinternet/noon/releases/download/v0.19.0/noon-v0.19.0-linux-x64.tar.gz"
      sha256 "54ba60cc04208ef15d301e8dc07a388cbcf6fed2b9d3f19ae0716b438ddf79b0"
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
