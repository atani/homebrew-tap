class Mysh < Formula
  desc "MySQL connection manager with SSH tunnel support"
  homepage "https://github.com/atani/mysh"
  version "0.1.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/atani/mysh/releases/download/v0.1.1/mysh-darwin-amd64"
      sha256 "b74416ca5d2d26d503d626cd58571cb7a071b5a5cf7b5878e971bb8836199b6a"
    else
      url "https://github.com/atani/mysh/releases/download/v0.1.1/mysh-darwin-arm64"
      sha256 "846ee1ea11140eb4bb72f6a5b159bd7e4b645615ec0a4f1ec0a7caf57a72c7fd"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/atani/mysh/releases/download/v0.1.1/mysh-linux-amd64"
      sha256 "7ae11c85fca5c5c4ec90cccad7ce8b0805c85b4dbed28dcbc3709d92019cada5"
    else
      url "https://github.com/atani/mysh/releases/download/v0.1.1/mysh-linux-arm64"
      sha256 "cd243595b8b0d6907edddecbb7d5e18556e61657b896c317c970169b580ae987"
    end
  end

  def install
    binary = Dir["mysh-*"].first || "mysh"
    bin.install binary => "mysh"
  end

  test do
    assert_match "mysh", shell_output("#{bin}/mysh help")
  end
end
