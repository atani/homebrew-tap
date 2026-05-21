class Mysh < Formula
  desc "MySQL connection manager with SSH tunnel support"
  homepage "https://github.com/atani/mysh"
  version "0.6.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/atani/mysh/releases/download/v0.6.0/mysh-darwin-amd64"
      sha256 "f6166426c744349b577ca250182ed225b37830117561554d0f213fc62bf8ca76"
    else
      url "https://github.com/atani/mysh/releases/download/v0.6.0/mysh-darwin-arm64"
      sha256 "d9d7b185f0b37fdf7bcb4bea98a980cf519014d64b21579c474014be61175753"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/atani/mysh/releases/download/v0.6.0/mysh-linux-amd64"
      sha256 "6e9888641bdd7ac97b1a410fc53b70e269efe8bd88e46adfde5b46cdaaf73fdc"
    else
      url "https://github.com/atani/mysh/releases/download/v0.6.0/mysh-linux-arm64"
      sha256 "bc2040e8a7fcea9a108d5983f5e6ad23e6cca7ba495fdcc2bec6c8e9462a5613"
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
