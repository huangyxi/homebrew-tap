class BrewNoQuarantine < Formula
  desc "Homebrew wrapper to remove the quarantine attribute from casks"
  homepage "https://github.com/huangyxi/brew-no-quarantine"
  url "https://github.com/huangyxi/brew-no-quarantine/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "5284b86112bfcf5f380b3d7e8b06c0bd41ecb6f033e68a6816dd82154aa3daac"
  license "MIT"

  depends_on :macos

  def install
    ENV["VERSION"] = version

    bin.install "bin/#{name}"

    bash_completion.install "completions/bash/#{name}"
    fish_completion.install "completions/fish/#{name}.fish"
    zsh_completion.install "completions/zsh/_#{name}"
  end

  test do
    refute_empty shell_output("#{bin/name} --version")
  end
end
