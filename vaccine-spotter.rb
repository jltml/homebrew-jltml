class VaccineSpotter < Formula
  desc "Get notified of COVID vaccine appointments from the command-line (beta)"
  homepage "https://github.com/jltml/vaccine-spotter-cli"
  url "https://github.com/jltml/vaccine-finder/archive/refs/tags/v0.2.1.tar.gz"
  sha256 "af0b38a4ed916d072f3edb798007259bfc0033de58e3984e51f63c3b843e1a50"
  license "MIT"

  bottle do
    root_url "https://github.com/jltml/homebrew-tap/releases/download/vaccine-spotter-0.2.0"
    sha256 cellar: :any_skip_relocation, catalina:     "692a755077caf1a5782f848e7a7968625eadf92ef0c082666cdbfb5c73250ba2"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "0cddf117ac76235e87f212a690726f00966a52d3006f1ac6394871208f41c593"
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
