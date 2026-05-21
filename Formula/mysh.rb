class Mysh < Formula
  desc "MySQL connection manager with SSH tunnel support"
  homepage "https://github.com/atani/mysh"
  version "0.8.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/atani/mysh/releases/download/v0.8.0/mysh-darwin-amd64"
      sha256 "a025aa9ba5b32c4d1eb15569d900ef9b402a745f622441fd12a195fbbd7a95d9"
    else
      url "https://github.com/atani/mysh/releases/download/v0.8.0/mysh-darwin-arm64"
      sha256 "8f290377b558cd1bce84d4987e0a784e00a34117dbd79f504363a68c9995307f"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/atani/mysh/releases/download/v0.8.0/mysh-linux-amd64"
      sha256 "ef9de7fd6315dfa99a74a242d5ad51d4edb182e95368011a33771b35a24a14ce"
    else
      url "https://github.com/atani/mysh/releases/download/v0.8.0/mysh-linux-arm64"
      sha256 "bae1abfbeeddd4bfaa802ff5e5285654f21e79b3279618b0cd19577a8c6733d2"
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
