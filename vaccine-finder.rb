# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class VaccineFinder < Formula
  desc "Get notified of COVID vaccine appointments from the command line. Install with RubyGems (still very much in beta)."
  homepage "https://github.com/jltml/vaccine-finder"
  url "https://github.com/jltml/vaccine-finder/archive/refs/tags/v0.1.5.tar.gz"
  sha256 "45232e2b737a6048396840d27b2a6f3e67af7423053220b9e9c57ad0972e7078"
  license ""

  bottle do
    sha256 big_sur: "8807de2d08caac2a96fb0fbd965aa8d8b5422816baa84fc4adeb17e7e127e94f"
  end

  uses_from_macos "ruby"

  def install
    # ENV.deparallelize  # if your formula fails when building in parallel
    ENV["GEM_HOME"] = libexec
    system "gem", "build", "#{name}.gemspec"
    system "gem", "install", "#{name}-#{version}.gem"
    bin.install libexec/"bin/#{name}"
    bin.env_script_all_files(libexec/"bin", GEM_HOME: ENV["GEM_HOME"])
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test vaccine-finder`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
