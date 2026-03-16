class BrewNoQuarantine < Formula
  desc "Homebrew wrapper to remove the quarantine attribute from casks"
  homepage "https://github.com/huangyxi/brew-no-quarantine"
  url "https://github.com/huangyxi/brew-no-quarantine/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "a891a60db3bd39396676e7aeaa1471673fc4b8ce3d237e14713f3fbdfe3dbf9c"
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
