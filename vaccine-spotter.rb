class VaccineSpotter < Formula
  desc "Get notified of COVID vaccine appointments from the command-line (beta)"
  homepage "https://github.com/jltml/vaccine-spotter-cli"
  url "https://github.com/jltml/vaccine-finder/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "2d53bf0b5c79e4ff79cdf03ab04d8791f518aa5038e05acac044b879efc90611"
  license "MIT"

  bottle do
    root_url "https://github.com/jltml/homebrew-tap/releases/download/vaccine-finder-0.1.8"
    sha256 cellar: :any_skip_relocation, catalina:     "347f8ebfb5bdd6eea1cc01199789d1b79b1c4a0883e8bc56f155c20e289d1b1d"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "18232f665f5b27f398a8d87ac4f5c6e49dcab519ecb66985d738f7848683508e"
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
