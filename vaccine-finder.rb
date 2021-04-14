class VaccineFinder < Formula
  desc "Get notified of COVID vaccine appointments from the command-line (beta)"
  homepage "https://github.com/jltml/vaccine-finder"
  url "https://github.com/jltml/vaccine-finder/archive/refs/tags/v0.1.6.tar.gz"
  sha256 "67db82650cdd7ca121fdcf01ea1b667a1766417bbb387332d9036b2092687061"
  license "MIT"

  bottle do
    root_url "https://github.com/jltml/homebrew-tap/releases/download/vaccine-finder-0.1.6"
    sha256 cellar: :any_skip_relocation, catalina:     "2053f3f3f79f0db2753e926c623bc2a680ecd769e82b027822386e5e4ad4685b"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "3eeb4fe8b1ebb7fdd03b5b0efb821fac078ca487f1ce1f2101619b7b90865d73"
  end

  uses_from_macos "curl"
  uses_from_macos "ruby"

  def install
    ENV["GEM_HOME"] = libexec
    system "gem", "build", "#{name}.gemspec"
    system "gem", "install", "#{name}-#{version}.gem"
    bin.install libexec/"bin/#{name}"
    bin.env_script_all_files(libexec/"bin", GEM_HOME: ENV["GEM_HOME"])
  end

  test do
    system "true"
  end
end
