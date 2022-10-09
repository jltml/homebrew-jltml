class Manymessage < Formula
  desc "Send mass texts with iMessage!"
  homepage "https://github.com/jltml/manymessage"
  url "https://github.com/jltml/manymessage/archive/refs/tags/v0.1.2.tar.gz"
  sha256 "cd8e051bafad21e69147216ad8d0af7cd5333ae58308954517d0bb3f9b0c4965"
  license "MIT"

  bottle do
    root_url "https://github.com/jltml/homebrew-tap/releases/download/manymessage-0.1.2"
    sha256                               big_sur:      "8c6a03edd0175ee369778efa0167f3ff07095abe589856ab3677e48fcdccc7ef"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "1fb5629cb8cdc580753faf39193c5f9d27b9b26a81d27c468fd8b0dc052af018"
  end

  depends_on :macos
  uses_from_macos "ruby"

  resource "contacts-cli" do
    url "https://github.com/pepebecker/contacts-cli/releases/download/v0.1.0/contacts-cli"
    sha256 "4a913c2425356785a411ae4cfa640b672a593139812dcd664505917e0d90bfb1"
  end

  def install
    ENV["GEM_HOME"] = libexec
    ENV["GEM_PATH"] = libexec
    system "gem", "build", "#{name}.gemspec"
    system "gem", "install", "-V", "#{name}-#{version}.gem", "--no-document"
    (libexec/"lib").install Dir["lib/*"]
    system "gem", "pristine", "-V", "--all"
    bin.install "exe/#{name}"
    bin.env_script_all_files(libexec/"bin", GEM_HOME: ENV["GEM_HOME"])
    (libexec/"exe").install resource("contacts-cli")
    chmod 0555, libexec/"exe"/"contacts-cli"
  end

  test do
    assert_equal "manymessage #{version}", shell_output("#{bin}/manymessage --version").lines.first.strip
  end
end
