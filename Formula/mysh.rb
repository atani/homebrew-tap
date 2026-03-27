class Mysh < Formula
  desc "MySQL connection manager with SSH tunnel support"
  homepage "https://github.com/atani/mysh"
  version "0.3.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/atani/mysh/releases/download/v0.3.2/mysh-darwin-amd64"
      sha256 "0a346e00c92c41a790a475c829f00b32091ffbb38c12dfa50d625c321028f0fd"
    else
      url "https://github.com/atani/mysh/releases/download/v0.3.2/mysh-darwin-arm64"
      sha256 "2b57db5a144f3d9a24e5f5c0f83ee82fd2ac962829050d8364ef6b7ca1d79518"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/atani/mysh/releases/download/v0.3.2/mysh-linux-amd64"
      sha256 "23f392566ecdb586578f2e924cae4b6cf2eb05450d7ae1ecffb0689b871dae01"
    else
      url "https://github.com/atani/mysh/releases/download/v0.3.2/mysh-linux-arm64"
      sha256 "e7663d91b46717d46c50f55b83e7cb16a6f56dc4407526a261d1748b9693d554"
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
