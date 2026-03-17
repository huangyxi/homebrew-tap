class BrewNoQuarantine < Formula
  desc "Homebrew wrapper to remove the quarantine attribute from casks"
  homepage "https://github.com/huangyxi/brew-no-quarantine"
  url "https://github.com/huangyxi/brew-no-quarantine/archive/refs/tags/v0.1.2.tar.gz"
  sha256 "04e46ac3d393f62b13191519d4730beb37ee33a84cf84e64a88af7d8314dddb1"
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
