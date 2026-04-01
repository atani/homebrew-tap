class Mysh < Formula
  desc "MySQL connection manager with SSH tunnel support"
  homepage "https://github.com/atani/mysh"
  version "0.5.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/atani/mysh/releases/download/v0.5.1/mysh-darwin-amd64"
      sha256 "5eb00496f6459504d52ab38fe2076ecb560f808f200f28d8b204976b2f8a0678"
    else
      url "https://github.com/atani/mysh/releases/download/v0.5.1/mysh-darwin-arm64"
      sha256 "528c5e7c314a3bb40d998ff5209a8a71cb848f9f6764a7e832219715ca8ecc65"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/atani/mysh/releases/download/v0.5.1/mysh-linux-amd64"
      sha256 "f5c2748734eee68f4eb32da44ca8c49c25e915745dbf4c439f2d0195dc72b269"
    else
      url "https://github.com/atani/mysh/releases/download/v0.5.1/mysh-linux-arm64"
      sha256 "b270805367c0a3adaee74a385a29a36276214ac0c0f8ec2ed2fc1c0a24200030"
    end
  end

  def install
    downloaded = Dir["mysh-*"].first || "mysh"
    bin.install downloaded => "mysh"
  end

  test do
    assert_match "mysh", shell_output("#{bin}/mysh help")
  end
end
