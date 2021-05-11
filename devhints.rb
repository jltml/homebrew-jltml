class Devhints < Formula
  desc "Get notified of COVID vaccine appointments from the command-line (beta)"
  homepage "https://github.com/jltml/devhints-cli"
  url "https://github.com/jltml/devhints-cli/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "7802ddf7cee251a0ed326e59a356ad1f68853c95c4006057ea4870d439173731"
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
