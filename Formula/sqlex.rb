class Sqlex < Formula
  desc "SQL syntax checker and linter"
  homepage "https://github.com/atani/sqlex"
  version "0.4.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/atani/sqlex/releases/download/v0.4.0/sqlex-darwin-x86_64"
      sha256 "ca44f551d64e14aab7c781eb10191eff4c4fa4c1fb886091ab7c16a0d2fc27cd"
    else
      url "https://github.com/atani/sqlex/releases/download/v0.4.0/sqlex-darwin-aarch64"
      sha256 "d1f9bfe2d0dc166b38c5d4ff2f79c5293fec7e475f85048feaa42c4d9feb5bbf"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/atani/sqlex/releases/download/v0.4.0/sqlex-linux-x86_64"
      sha256 "d31412b7e0b7bdeb9de4bf754ab3c517ef4c6bf8535b40bc8f98a1c33539b967"
    else
      url "https://github.com/atani/sqlex/releases/download/v0.4.0/sqlex-linux-aarch64"
      sha256 "ebe36145e77198e8b4b3b24b5cc39099ba6c6445fe5e7c0ac1d4e81e71fa09a4"
    end
  end

  def install
    bin.install Dir["sqlex-*"].first => "sqlex"
  end

  test do
    system "#{bin}/sqlex", "--version"
  end
end
