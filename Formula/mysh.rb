class Mysh < Formula
  desc "MySQL connection manager with SSH tunnel support"
  homepage "https://github.com/atani/mysh"
  version "0.11.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/atani/mysh/releases/download/v0.11.0/mysh-darwin-amd64"
      sha256 "176c06ddb826c9e5cacf1d6f7a3f1fa00df6c549e260f2af4e4c9bd10a3bcdc6"
    else
      url "https://github.com/atani/mysh/releases/download/v0.11.0/mysh-darwin-arm64"
      sha256 "c6601adb21b78bc7a2aba25e6d28a43e5111bc5fbe962cf4d099acb6c29867dd"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/atani/mysh/releases/download/v0.11.0/mysh-linux-amd64"
      sha256 "ea04d949e7ed1a6b8dd37a06074128adf43ff58f8ea32d7a36dfbff95406c833"
    else
      url "https://github.com/atani/mysh/releases/download/v0.11.0/mysh-linux-arm64"
      sha256 "2539a4e966ac01f4c42ade82c146c80b2e170e21bbbd10c8996008e615638f37"
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
