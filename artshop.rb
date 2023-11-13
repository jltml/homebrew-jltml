class Artshop < Formula
  desc "Command-line interface for Max's art store at mapellentz.art"
  homepage "https://github.com/jltml/artshop"
  url "https://github.com/jltml/artshop/archive/refs/tags/v0.0.3.tar.gz"
  sha256 "f5b85f565ba6fd6009da149638ac493e213ccff06830f8ad26b42441e8325c18"
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
    system "true"
  end
end
