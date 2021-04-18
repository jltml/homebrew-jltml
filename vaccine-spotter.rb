class VaccineSpotter < Formula
  desc "Get notified of COVID vaccine appointments from the command-line (beta)"
  homepage "https://github.com/jltml/vaccine-spotter-cli"
  url "https://github.com/jltml/vaccine-finder/archive/refs/tags/v0.2.2.tar.gz"
  sha256 "17fc4db59c280296b1bc1fc75097d198c41673b5e8d8ff31419a2ccfbb2a4efc"
  license "MIT"

  bottle do
    root_url "https://github.com/jltml/homebrew-tap/releases/download/vaccine-spotter-0.2.1"
    sha256 cellar: :any_skip_relocation, catalina:     "7138460f015d2f43a719e9fffb0f8bd0f3cea4da4edfeaf4c85077224a458e06"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "c45c9866eb7f33f50fc36059dfb2e41dfabde00d3df2828687ca4e2d04e1c3fe"
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
