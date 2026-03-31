class Mysh < Formula
  desc "MySQL connection manager with SSH tunnel support"
  homepage "https://github.com/atani/mysh"
  version "0.4.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/atani/mysh/releases/download/v0.4.0/mysh-darwin-amd64"
      sha256 "7415d3d31668f5aa16408aee266b4468d701548d3e29af8086f2528c70bef113"
    else
      url "https://github.com/atani/mysh/releases/download/v0.4.0/mysh-darwin-arm64"
      sha256 "4daf44dcdc71a9fbc62247f63d32d5e912c303b9c827e869d85c43c974a88827"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/atani/mysh/releases/download/v0.4.0/mysh-linux-amd64"
      sha256 "4693a53237419165c651e61d5f0dd555f4c9a6f012baa79f8fddef238b7fafd3"
    else
      url "https://github.com/atani/mysh/releases/download/v0.4.0/mysh-linux-arm64"
      sha256 "5cbf1cab8467d51dd1ea093c2bc544b3624556894216238d41d1e4cf34f34bf3"
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
