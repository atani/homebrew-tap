class Mysh < Formula
  desc "MySQL connection manager with SSH tunnel support"
  homepage "https://github.com/atani/mysh"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/atani/mysh/releases/download/v0.1.0/mysh-darwin-amd64"
      sha256 "10ada4d274d4e7d16d9c48c2e0b126ec13317ce3a1813d8bf27dfa008efbe4fb"
    else
      url "https://github.com/atani/mysh/releases/download/v0.1.0/mysh-darwin-arm64"
      sha256 "f38a66aa7e5c11b11e2eb296049542484228202c045431b54c9a2f5a8f47ba79"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/atani/mysh/releases/download/v0.1.0/mysh-linux-amd64"
      sha256 "c7503258c7c14ea9552041f008bb03d9916065a4c3fdd7d90a805bcd8cfd963d"
    else
      url "https://github.com/atani/mysh/releases/download/v0.1.0/mysh-linux-arm64"
      sha256 "7577278fd0098d87983ae8d409a19848380a1dbb7075bef34c8e713c25f343ff"
    end
  end

  def install
    bin.install "mysh" => "mysh"
  end

  test do
    assert_match "mysh", shell_output("#{bin}/mysh help")
  end
end
