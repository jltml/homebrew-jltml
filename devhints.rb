class Devhints < Formula
  desc "Get notified of COVID vaccine appointments from the command-line (beta)"
  homepage "https://github.com/jltml/devhints-cli"
  url "https://github.com/jltml/devhints-cli/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "3bb220261481b3ebb646c45750480d69feb338867ae1b6d6b12c73127e4df114"
  license "MIT"

  bottle do
    root_url "https://github.com/jltml/homebrew-tap/releases/download/devhints-0.1.1"
    sha256 cellar: :any_skip_relocation, catalina:     "18df46b65eef95dcf814466fb3e06d072c4635fb9b47d7934d5bdb89e945de1f"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "7e3e71fd92fa59fd8c16eb265ae12ad1050cea94d838f0c7720094e0eb713c48"
  end

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
