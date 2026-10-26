class Noon < Formula
  desc "Local-first repository job scheduler"
  homepage "https://github.com/brettinternet/noon"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/brettinternet/noon/releases/download/v0.13.0/noon-v0.13.0-macos-arm64.tar.gz"
      sha256 "572cb25cb98c856e30acd3618910ed267ae1cc122a7dde82ce70b2115929d6b7"
    end
    on_intel do
      url "https://github.com/brettinternet/noon/releases/download/v0.13.0/noon-v0.13.0-macos-x64.tar.gz"
      sha256 "dc5ea628d0c11b84970756ed8223636461081314f7495c7f8c6fcbf152edbca3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/brettinternet/noon/releases/download/v0.13.0/noon-v0.13.0-linux-arm64.tar.gz"
      sha256 "c4710e629e285fe259f064d01ad2953357e9ac3f564b1c24ac4ff3cc845f1e30"
    end
    on_intel do
      url "https://github.com/brettinternet/noon/releases/download/v0.13.0/noon-v0.13.0-linux-x64.tar.gz"
      sha256 "8cf78d278408c4f9a9ee7cdfd0d57a534617b853f52490f7c1ebb07e5c3f037f"
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
