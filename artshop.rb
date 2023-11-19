class Artshop < Formula
  desc "Command-line interface for Max's art store at mapellentz.art"
  homepage "https://github.com/jltml/artshop"
  url "https://github.com/jltml/artshop/archive/refs/tags/v0.0.5.tar.gz"
  sha256 "1800a894ad259ac47e44396a4c7c6106ae61352025e09a36e909ce7de03ffb49"

  depends_on "ruby"

  def install
    ENV["GEM_HOME"] = libexec
    ENV["GEM_PATH"] = libexec
    system "gem", "build", "#{name}.gemspec"
    system "gem", "install", "-V", "#{name}-#{version}.gem", "--no-document"
    (libexec/"lib").install Dir["lib/*"]
    bin.install "exe/#{name}"
    bin.env_script_all_files(libexec/"bin", GEM_HOME: ENV["GEM_HOME"])
    chmod 0555, libexec/"bin"/name
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
