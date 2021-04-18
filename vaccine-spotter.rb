class VaccineSpotter < Formula
  desc "Get notified of COVID vaccine appointments from the command-line (beta)"
  homepage "https://github.com/jltml/vaccine-spotter-cli"
  url "https://github.com/jltml/vaccine-finder/archive/refs/tags/v0.2.4.tar.gz"
  sha256 "fcd31c5308133b87b74d5f1cf7d2867d05ff67a61e082ac841189166d86b051a"
  license "MIT"

  bottle do
    root_url "https://github.com/jltml/homebrew-tap/releases/download/vaccine-spotter-0.2.2"
    sha256 cellar: :any_skip_relocation, catalina:     "cc9dbab2aef421250d11100b1adedff66f5ecaf6d927ab93138dcc6d9ba9a9db"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "c583e0518c61bf731d008ec4be7e97062abebfb95d67ae68f635d4b6c86134b5"
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
