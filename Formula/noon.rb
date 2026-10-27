class Noon < Formula
  desc "Local-first repository job scheduler"
  homepage "https://github.com/brettinternet/noon"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/brettinternet/noon/releases/download/v0.14.0/noon-v0.14.0-macos-arm64.tar.gz"
      sha256 "276ee18d5aa0ef083c9d6c8e8f253a9cdb90666bebc5a27f3eb9a0afb9eee157"
    end
    on_intel do
      url "https://github.com/brettinternet/noon/releases/download/v0.14.0/noon-v0.14.0-macos-x64.tar.gz"
      sha256 "3b203b13a52762b36138bf4716d0fc8ca12b1c1b4cb7e1d2997900eb60847ed1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/brettinternet/noon/releases/download/v0.14.0/noon-v0.14.0-linux-arm64.tar.gz"
      sha256 "0b3eab20f95f68d43b9baa7ac5ef4a5234211107b3993ba723fee406f2252a79"
    end
    on_intel do
      url "https://github.com/brettinternet/noon/releases/download/v0.14.0/noon-v0.14.0-linux-x64.tar.gz"
      sha256 "b37165f9ecca72c4c222bfed286b4bbd0b9cd93ad1f4dc8a3207ee2cff4798d2"
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
