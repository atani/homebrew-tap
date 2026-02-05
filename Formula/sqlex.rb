class Sqlex < Formula
  desc "SQL syntax checker and linter"
  homepage "https://github.com/atani/sqlex"
  version "0.3.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/atani/sqlex/releases/download/v0.3.0/sqlex-darwin-x86_64"
      sha256 "fb2afce2b4f7a1c87f3b6824a21c88ca0da7867f317fc4e30b151c5993a674c2"
    else
      url "https://github.com/atani/sqlex/releases/download/v0.3.0/sqlex-darwin-aarch64"
      sha256 "0ebfa47033e8ee4ac95dcc421473296c4a61667e2822e157c45896ef73a6fa4f"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/atani/sqlex/releases/download/v0.3.0/sqlex-linux-x86_64"
      sha256 "fc100e067dfc7f43987ed6f4ab531db99ec99024beb4a411ac1d80c07c7b97be"
    else
      url "https://github.com/atani/sqlex/releases/download/v0.3.0/sqlex-linux-aarch64"
      sha256 "43a3b641b4c6b04ab31f68130d9be9a21183d2cd5b55277009177804d909617d"
    end
  end

  def install
    bin.install Dir["sqlex-*"].first => "sqlex"
  end

  test do
    system "#{bin}/sqlex", "--version"
  end
end
