class VaccineSpotter < Formula
  desc "Get notified of COVID vaccine appointments from the command-line (beta)"
  homepage "https://github.com/jltml/vaccine-spotter-cli"
  url "https://github.com/jltml/vaccine-finder/archive/refs/tags/v0.2.5.tar.gz"
  sha256 "69ba76338f5db13af7b06ade020aeb5bd7cad6136667439813824985ad2c73fd"
  license "MIT"

  bottle do
    root_url "https://github.com/jltml/homebrew-tap/releases/download/vaccine-spotter-0.2.4"
    sha256 cellar: :any_skip_relocation, catalina:     "0f2557ab3db1678bff35eaffcf1cdfee4c67ae38d9b45cbddaa74e4ff5f86965"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "8104fac397ecaa95dfd88c1ce78882c7c5367d9382f6565553a8a6486e822be9"
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
