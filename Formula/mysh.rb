class Mysh < Formula
  desc "MySQL connection manager with SSH tunnel support"
  homepage "https://github.com/atani/mysh"
  version "0.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/atani/mysh/releases/download/v0.2.0/mysh-darwin-amd64"
      sha256 "67b5e6407cce6defed91f8c1a4f04c92109c05fefd28a8c4f533d49df369711e"
    else
      url "https://github.com/atani/mysh/releases/download/v0.2.0/mysh-darwin-arm64"
      sha256 "312c21c05dd8638298a264165a3be882114f8e148cedd2f298fa9d6e84652e0d"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/atani/mysh/releases/download/v0.2.0/mysh-linux-amd64"
      sha256 "a3547030400540665fe03843343047af842679d84d1f48a66372e40183f8661b"
    else
      url "https://github.com/atani/mysh/releases/download/v0.2.0/mysh-linux-arm64"
      sha256 "127dde37e8ec9a2dc547417b1ca0b07c3f05046fb732561770da58f1e2c14a95"
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
