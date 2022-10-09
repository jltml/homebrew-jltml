class Manymessage < Formula
  desc "Send mass texts with iMessage!"
  homepage "https://github.com/jltml/manymessage"
  url "https://github.com/jltml/manymessage/archive/refs/tags/v0.1.2.tar.gz"
  sha256 "cd8e051bafad21e69147216ad8d0af7cd5333ae58308954517d0bb3f9b0c4965"
  license "MIT"

  uses_from_macos "curl"
  uses_from_macos "ruby"

  resource "contacts-cli" do
    url "https://github.com/pepebecker/contacts-cli/releases/download/v0.1.0/contacts-cli"
    sha256 "4a913c2425356785a411ae4cfa640b672a593139812dcd664505917e0d90bfb1"
  end

  def install
    ENV["GEM_HOME"] = libexec
    system "gem", "build", "#{name}.gemspec"
    system "gem", "install", "#{name}-#{version}.gem", "--no-document"
    (libexec/"lib").install Dir["lib/*"]
    bin.install "exe/#{name}"
    bin.env_script_all_files(libexec/"bin", GEM_HOME: ENV["GEM_HOME"])
    (libexec/"exe").install resource("contacts-cli")
    chmod 0555, libexec/"exe"/"contacts-cli"
  end

  test do
    assert_equal "manymessage #{version}", shell_output("#{bin}/manymessage --version").lines.first.strip
  end
end
