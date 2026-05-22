class Mysh < Formula
  desc "MySQL connection manager with SSH tunnel support"
  homepage "https://github.com/atani/mysh"
  version "0.9.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/atani/mysh/releases/download/v0.9.0/mysh-darwin-amd64"
      sha256 "f44381d9229fcb7b9eb854876631d3ac1e0f447a378bc6d8c6ed464f6466c9ca"
    else
      url "https://github.com/atani/mysh/releases/download/v0.9.0/mysh-darwin-arm64"
      sha256 "af36107f3a085a4a51b31e5213a1a6a26c294304e4232200fd58b3323cbfcf7e"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/atani/mysh/releases/download/v0.9.0/mysh-linux-amd64"
      sha256 "8b40dd17458e4a9cf2178c5f82dc3bb4bf0f746876395044b1309ca1d8f09ef2"
    else
      url "https://github.com/atani/mysh/releases/download/v0.9.0/mysh-linux-arm64"
      sha256 "3ccb08e7ee8d0354268156182f8fba919b136e1b94ff098991b020bc5627a481"
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
