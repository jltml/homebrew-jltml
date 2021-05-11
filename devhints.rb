class Devhints < Formula
  desc "Get notified of COVID vaccine appointments from the command-line (beta)"
  homepage "https://github.com/jltml/devhints-cli"
  url "https://github.com/jltml/devhints-cli/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "3bb220261481b3ebb646c45750480d69feb338867ae1b6d6b12c73127e4df114"
  license "MIT"

  uses_from_macos "ruby"

  def install
    ENV["GEM_HOME"] = libexec
    system "gem", "build", "#{name}.gemspec"
    system "gem", "install", "#{name}-#{version}.gem"
    bin.install libexec/"bin/#{name}"
    bin.env_script_all_files(libexec/"bin", GEM_HOME: ENV["GEM_HOME"])
  end

  test do
    system "devhints ruby"
  end
end
