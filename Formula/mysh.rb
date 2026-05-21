class Mysh < Formula
  desc "MySQL connection manager with SSH tunnel support"
  homepage "https://github.com/atani/mysh"
  version "0.7.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/atani/mysh/releases/download/v0.7.0/mysh-darwin-amd64"
      sha256 "604a850324124ce552ee8b78fdaad39967410903b51c8f7b015b5c7fb7a4a5c8"
    else
      url "https://github.com/atani/mysh/releases/download/v0.7.0/mysh-darwin-arm64"
      sha256 "e2226f1b965ec101b7aaecebed44fa8716c136910851040c467e44f764f08f4c"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/atani/mysh/releases/download/v0.7.0/mysh-linux-amd64"
      sha256 "bf0f7e076cd184fab5546adfe6bfbf2c378f992fba5ad92055e7714a120106e8"
    else
      url "https://github.com/atani/mysh/releases/download/v0.7.0/mysh-linux-arm64"
      sha256 "e3f505fe9d7a9ae6ab04922bf7834ad4b7738bdd8658fe28a797f0232950cd93"
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
