class Artshop < Formula
  desc "Command-line interface for Max's art store at mapellentz.art"
  homepage "https://github.com/jltml/artshop"
  url "https://github.com/jltml/artshop/archive/refs/tags/v0.0.4.tar.gz"
  sha256 "f2ccaae08173451c1db85755fd3a500136bf96e17d867856c9a14c5c4d667e18"
  license "MIT"

  depends_on "ruby"

  def install
    bin.install "bin/artshop"
    lib.install Dir["lib/*"]
  end

  def caveats
    <<~EOS
      This depends on the 1Password CLI. Install it with
        `brew install --cask 1password-cli`.
    EOS
  end

  test do
    assert_equal "artshop #{version}", shell_output("#{bin}/artshop --version").lines.first.strip
  end
end
