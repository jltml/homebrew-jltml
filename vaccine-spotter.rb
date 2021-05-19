class VaccineSpotter < Formula
  desc "Get notified of COVID vaccine appointments from the command-line (beta)"
  homepage "https://github.com/jltml/vaccine-spotter-cli"
  url "https://github.com/jltml/vaccine-spotter-cli/archive/refs/tags/v0.2.5.tar.gz"
  sha256 "69ba76338f5db13af7b06ade020aeb5bd7cad6136667439813824985ad2c73fd"
  license "MIT"

  bottle do
    root_url "https://github.com/jltml/homebrew-tap/releases/download/vaccine-spotter-0.2.5"
    sha256 cellar: :any_skip_relocation, catalina:     "43990c73499985aa2e37624e412f3bd324b47fa19cd117fb82d63d90be89259c"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "88deaebda3ede9ffcc1b90b47e3a65875eefec39b014e7d6a0d019591858c255"
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
