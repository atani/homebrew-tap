class Mysh < Formula
  desc "MySQL connection manager with SSH tunnel support"
  homepage "https://github.com/atani/mysh"
  version "0.10.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/atani/mysh/releases/download/v0.10.0/mysh-darwin-amd64"
      sha256 "1ed5fc9e3c4f884ebe3f0b7e57285e5ad27df069c9bd08c552f9d4808f599cb1"
    else
      url "https://github.com/atani/mysh/releases/download/v0.10.0/mysh-darwin-arm64"
      sha256 "9168336387d7a0d211fea4061a265a7a7ace34cc7e6065d0d79e8488c05af332"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/atani/mysh/releases/download/v0.10.0/mysh-linux-amd64"
      sha256 "1ac45febde9cc32fbf3417906f7d0cc5d47129b29bba26bb96bbd4c1553ac3b4"
    else
      url "https://github.com/atani/mysh/releases/download/v0.10.0/mysh-linux-arm64"
      sha256 "8680fe7e0b479a68db20e813ca354731bbdf8e16ecb464ef3f6d828ebc7ae541"
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
