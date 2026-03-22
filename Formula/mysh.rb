class Mysh < Formula
  desc "MySQL connection manager with SSH tunnel support"
  homepage "https://github.com/atani/mysh"
  version "0.3.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/atani/mysh/releases/download/v0.3.1/mysh-darwin-amd64"
      sha256 "62d23b4cefff24c22a4d5fc1dcff50c202f3ecc7661e913967b2afa05dbc33e3"
    else
      url "https://github.com/atani/mysh/releases/download/v0.3.1/mysh-darwin-arm64"
      sha256 "7f575a04c5db233954ce03084a3a050d54efa1c67aff606f8937a78b077278c7"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/atani/mysh/releases/download/v0.3.1/mysh-linux-amd64"
      sha256 "82ec9c5cc0801ed3ff0c0d83800a9e8fe0bb7245a76b04c0e4bf13756f6ff8c5"
    else
      url "https://github.com/atani/mysh/releases/download/v0.3.1/mysh-linux-arm64"
      sha256 "e77e0530be2ea821c35c6bc277939d75f30d9ddc4fc36ad7ff93b566a510e9bf"
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
