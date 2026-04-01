class Mysh < Formula
  desc "MySQL connection manager with SSH tunnel support"
  homepage "https://github.com/atani/mysh"
  version "0.5.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/atani/mysh/releases/download/v0.5.0/mysh-darwin-amd64"
      sha256 "3081bfe455536aa2b0dce023b9696ee2f9e4f796d24ba647b96750cfa999df08"
    else
      url "https://github.com/atani/mysh/releases/download/v0.5.0/mysh-darwin-arm64"
      sha256 "f795c2889fa0b8bb01c82ae3ba9148e946b7f28be7c9cbb694e5e4b04482d269"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/atani/mysh/releases/download/v0.5.0/mysh-linux-amd64"
      sha256 "441f116829dcf751b4160020c52e4d70e13b886e241ac61e8312b5281d35a6bd"
    else
      url "https://github.com/atani/mysh/releases/download/v0.5.0/mysh-linux-arm64"
      sha256 "7ec9e3bc76c38aeaf665575bdf3b86ffc0483fd8b82307891233db149635322b"
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
