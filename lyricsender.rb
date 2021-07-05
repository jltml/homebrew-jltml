class Lyricsender < Formula
  desc "Send lyrics, line-by-line, using iMessage"
  homepage "https://github.com/jltml/lyricsender"
  url "https://github.com/jltml/lyricsender/archive/refs/tags/v0.0.0.tar.gz"
  sha256 "aa8230ee4884b91cbb9eeac74456e790dbc9661109fb1413cea56714418a98ff"
  license "MIT"

  uses_from_macos "ruby"

  def install
    ENV["GEM_HOME"] = libexec
    system "gem", "build", "#{name}.gemspec"
    system "gem", "install", "-V", "#{name}-#{version}.gem", "--no-document", "--platform=ruby", "--", "--use-system-libraries"
    bin.install libexec/"bin/#{name}"
    bin.env_script_all_files(libexec/"bin", GEM_HOME: ENV["GEM_HOME"])
  end

  test do
    assert_equal "lyricsender v#{version}", shell_output("#{bin}/lyricsender --version").strip
  end
end
