class Lyricsender < Formula
  desc "Send lyrics, line-by-line, using iMessage"
  homepage "https://github.com/jltml/lyricsender"
  url "https://github.com/jltml/lyricsender/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "d4cdd3ac32f864088f145d92ebb552b6af90ad78729eebccf83656efd1d60748"
  license "MIT"

  uses_from_macos "libxml2" => :build
  uses_from_macos "libxslt" => :build
  uses_from_macos "ruby"

  def install
    ENV["GEM_HOME"] = libexec
    ENV["GEM_PATH"] = libexec
    system "gem", "build", "#{name}.gemspec"
    system "gem", "install", "-V", "#{name}-#{version}.gem", "--no-document", "--platform=ruby", "--", "--use-system-libraries"
    system "gem", "pristine", "-V", "--all"
    bin.install libexec/"bin/#{name}"
    bin.env_script_all_files(libexec/"bin", GEM_HOME: ENV["GEM_HOME"])
  end

  test do
    assert_equal "lyricsender v#{version}", shell_output("#{bin}/lyricsender --version").strip
  end
end
