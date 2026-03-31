class Mysh < Formula
  desc "MySQL connection manager with SSH tunnel support"
  homepage "https://github.com/atani/mysh"
  version "0.3.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/atani/mysh/releases/download/v0.3.3/mysh-darwin-amd64"
      sha256 "5b9087ac70f997b45720cc82da2900442607d4524f14481898a767fe97771d77"
    else
      url "https://github.com/atani/mysh/releases/download/v0.3.3/mysh-darwin-arm64"
      sha256 "f9e6cac6b5d30fbb1f958c27d5d0fda53de31aab0adb8f1685170be1bbe65f1e"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/atani/mysh/releases/download/v0.3.3/mysh-linux-amd64"
      sha256 "c1c543e2d23a71beeb41bff4cf9f22d65dfa11e03ca9805960fdabcbd6c9a476"
    else
      url "https://github.com/atani/mysh/releases/download/v0.3.3/mysh-linux-arm64"
      sha256 "980d0dc51904c1f8f9d4eae7257c9b42b2986a4485707efdb2475b6a983f406d"
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
