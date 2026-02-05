class Sqlex < Formula
  desc "SQL syntax checker and linter"
  homepage "https://github.com/atani/sqlex"
  version "0.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/atani/sqlex/releases/download/v0.2.0/sqlex-darwin-x86_64"
      sha256 "c416e3fb4cce300b54fdb2996de0acd3f28d069721576e25f6e49775e9fa97f1"
    else
      url "https://github.com/atani/sqlex/releases/download/v0.2.0/sqlex-darwin-aarch64"
      sha256 "2fd2b85b0650d12e5a86095e58f6752f20404a6559d87eb6e625bca464f802bb"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/atani/sqlex/releases/download/v0.2.0/sqlex-linux-x86_64"
      sha256 "7e0b0e05b7aa1b52843c966425c5a0d54479ea5f2b7e855b4ba47599cffb23a4"
    else
      url "https://github.com/atani/sqlex/releases/download/v0.2.0/sqlex-linux-aarch64"
      sha256 "09bba4392ab702490ce8f7620d7cb6cb29bb7b054570f9b7caf017deeda11d26"
    end
  end

  def install
    bin.install Dir["sqlex-*"].first => "sqlex"
  end

  test do
    system "#{bin}/sqlex", "--version"
  end
end
