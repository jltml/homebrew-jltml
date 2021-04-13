class VaccineFinder < Formula
  desc "Get notified of COVID vaccine appointments from the command-line (beta)"
  homepage "https://github.com/jltml/vaccine-finder"
  url "https://github.com/jltml/vaccine-finder/archive/refs/tags/v0.1.5.tar.gz"
  sha256 "45232e2b737a6048396840d27b2a6f3e67af7423053220b9e9c57ad0972e7078"
  license ""

  bottle do
    root_url "https://github.com/jltml/homebrew-tap/releases/download/vaccine-finder-0.1.5"
    sha256                               catalina:     "b0cdd81830548a392bd2fb25163aa545a069dcc65abffdf60eaed11d47d3206b"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "af0b2b67377a08add4de95f5f5da532c003b3d7be5047001a11148e6ff47c68e"
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
