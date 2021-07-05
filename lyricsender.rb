class Lyricsender < Formula
  desc "Send lyrics, line-by-line, using iMessage"
  homepage "https://github.com/jltml/lyricsender"
  url "https://github.com/jltml/lyricsender/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "b3a4880737d727ed17101fcbb5680456bb5be3c985a30e864043319998fd4de3"
  license "MIT"

  bottle do
    root_url "https://github.com/jltml/homebrew-tap/releases/download/lyricsender-0.1.1"
    sha256                               catalina:     "6810808815e27868908740351070993167c7a6188974990acbcbf5f88960b62e"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "978ce9b2f0b9eafe1b9b5155bcfcd3827983ff5ddfa42996bf5c3f55e155abf5"
  end

  uses_from_macos "libxml2"
  uses_from_macos "libxslt"
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
