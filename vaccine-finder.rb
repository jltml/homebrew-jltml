class VaccineFinder < Formula
  desc "Get notified of COVID vaccine appointments from the command-line (beta)"
  homepage "https://github.com/jltml/vaccine-finder"
  url "https://github.com/jltml/vaccine-finder/archive/refs/tags/v0.1.8.tar.gz"
  sha256 "c3116fbfa334d5b8bbc5bf628762ab620f43bb3bf483529273894be19bfea435"
  license "MIT"

  bottle do
    root_url "https://github.com/jltml/homebrew-tap/releases/download/vaccine-finder-0.1.7"
    sha256 cellar: :any_skip_relocation, catalina:     "1845827bc0fcabe9e790b7cdde8acc44b7b5fcc298e7fdc37f9bcaa547f7c5a6"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "52b3789016168fd6e20f4e3ecdc0f7159dd5308e4a651e9e8d1cdb1e94af68b3"
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
