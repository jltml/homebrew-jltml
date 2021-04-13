class VaccineFinder < Formula
  desc "Get notified of COVID vaccine appointments from the command-line (beta)"
  homepage "https://github.com/jltml/vaccine-finder"
  url "https://github.com/jltml/vaccine-finder/archive/refs/tags/v0.1.5.tar.gz"
  sha256 "45232e2b737a6048396840d27b2a6f3e67af7423053220b9e9c57ad0972e7078"
  license ""

  bottle do
    root_url "https://github.com/jltml/homebrew-tap/releases/download/vaccine-finder-0.1.5"
    sha256                               catalina:     "f1f3eb49b4714233a5b54987d9bd224bf90c1c07d8405c9b044f3161087e8a85"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "2969e1bbab057c3db771a11ff3ccaf87a51cca560dfce886fcd83576de7f9242"
  end

  uses_from_macos "curl"
  uses_from_macos "ruby"

  def install
    ENV["GEM_HOME"] = libexec
    system "gem", "build", "#{name}.gemspec"
    system "gem", "install", "#{name}-#{version}.gem"
    bin.install libexec/"bin/#{name}"
    bin.env_script_all_files(libexec/"bin", GEM_HOME: ENV["GEM_HOME"])
    system "gem", "pristine", "curb"
    system "gem", "pristine", "racc"
  end

  test do
    system "true"
  end
end
