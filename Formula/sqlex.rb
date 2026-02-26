class Sqlex < Formula
  desc "SQL syntax checker and linter"
  homepage "https://github.com/atani/sqlex"
  version "0.3.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/atani/sqlex/releases/download/v0.3.1/sqlex-darwin-x86_64"
      sha256 "41db6000988695674788d4ddd14f08b307f77468d8d4bcda2e73618716228f6e"
    else
      url "https://github.com/atani/sqlex/releases/download/v0.3.1/sqlex-darwin-aarch64"
      sha256 "bddf696d8633be007060c78d0a80d66b00dcd1dc7dfbb67199f18bd42b35a6b1"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/atani/sqlex/releases/download/v0.3.1/sqlex-linux-x86_64"
      sha256 "a5e3147be7532499bfbe5163841cfbb237375d1672417a95d78c3f4c853a4912"
    else
      url "https://github.com/atani/sqlex/releases/download/v0.3.1/sqlex-linux-aarch64"
      sha256 "bf61882b9ef72630c6510a65b102a6f0e14117659b8614910489a19bbed58dda"
    end
  end

  def install
    bin.install Dir["sqlex-*"].first => "sqlex"
  end

  test do
    system "#{bin}/sqlex", "--version"
  end
end
