class Noon < Formula
  desc "Local-first repository job scheduler"
  homepage "https://github.com/brettinternet/noon"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/brettinternet/noon/releases/download/v0.20.1/noon-v0.20.1-macos-arm64.tar.gz"
      sha256 "c222115e702e9b7d8ea244bca6236e0aa9eb8a8ed74393c8f7647f83ea2655d3"
    end
    on_intel do
      url "https://github.com/brettinternet/noon/releases/download/v0.20.1/noon-v0.20.1-macos-x64.tar.gz"
      sha256 "06540805403f19d76e080d80d233d911e73bbd670d7293b77c7fb5584ee32968"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/brettinternet/noon/releases/download/v0.20.1/noon-v0.20.1-linux-arm64.tar.gz"
      sha256 "d3b8dcf5c83df7f2359ea97ed96abf97edfbcca3ddfcb360fdd0d8f2cd78dcc5"
    end
    on_intel do
      url "https://github.com/brettinternet/noon/releases/download/v0.20.1/noon-v0.20.1-linux-x64.tar.gz"
      sha256 "13a433e92fd7f1a6b033d78c91bc2561c7981c07d1a927a5c13d6d6b3fb28062"
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
