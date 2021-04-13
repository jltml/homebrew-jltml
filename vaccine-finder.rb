class VaccineFinder < Formula
  desc "Get notified of COVID vaccine appointments from the command-line (beta)"
  homepage "https://github.com/jltml/vaccine-finder"
  url "https://github.com/jltml/vaccine-finder/archive/refs/tags/v0.1.5.tar.gz"
  sha256 "45232e2b737a6048396840d27b2a6f3e67af7423053220b9e9c57ad0972e7078"
  license ""

  bottle do
    sha256 big_sur: "8807de2d08caac2a96fb0fbd965aa8d8b5422816baa84fc4adeb17e7e127e94f"
  end

  depends_on "curl"
  uses_from_macos "ruby"

  def install
    ENV["GEM_HOME"] = libexec
    system "gem", "build", "#{name}.gemspec"
    system "gem", "install", "#{name}-#{version}.gem"
    bin.install libexec/"bin/#{name}"
    bin.env_script_all_files(libexec/"bin", GEM_HOME: ENV["GEM_HOME"])
  end

  test do
    system "false"
  end
end
