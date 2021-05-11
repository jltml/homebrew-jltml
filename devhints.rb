class Devhints < Formula
  desc "Get notified of COVID vaccine appointments from the command-line (beta)"
  homepage "https://github.com/jltml/devhints-cli"
  url "https://github.com/jltml/devhints-cli/archive/refs/tags/v0.1.2.tar.gz"
  sha256 "0457f6ad1a305459c865079aa8b869f422e5f28f1f56ffd161684860808fc8d9"
  license "MIT"

  bottle do
    root_url "https://github.com/jltml/homebrew-tap/releases/download/devhints-0.1.2"
    sha256 cellar: :any_skip_relocation, catalina:     "0392a3c5b426ad7a1d16d21e1eb757a4a75d7982c50c6f1f305ae85c3e3ad03c"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "b4e294b2128f26fba7a17a0a0564db81f34e9fb5b3051bae2671c69e0454fada"
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
