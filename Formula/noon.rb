class Noon < Formula
  desc "Local-first repository job scheduler"
  homepage "https://github.com/brettinternet/noon"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/brettinternet/noon/releases/download/v0.18.0/noon-v0.18.0-macos-arm64.tar.gz"
      sha256 "e5f3a91508f09f016b299f634e2c8b3a4ba52ce84bbc9b72a7dd8b9acdaca166"
    end
    on_intel do
      url "https://github.com/brettinternet/noon/releases/download/v0.18.0/noon-v0.18.0-macos-x64.tar.gz"
      sha256 "94dccdfadc8a43ea3ca742ac3add87be0625432cfaef546c9abe8835fc2ef8ae"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/brettinternet/noon/releases/download/v0.18.0/noon-v0.18.0-linux-arm64.tar.gz"
      sha256 "426ec749916f37d14875f51500d3c7c821b1f48f3964e9b11d06a21d7cbe9eda"
    end
    on_intel do
      url "https://github.com/brettinternet/noon/releases/download/v0.18.0/noon-v0.18.0-linux-x64.tar.gz"
      sha256 "0b10fc458ae1f43693375c8001823dab0543f4e9ebf4639e8c2b78f1cfe934b0"
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
