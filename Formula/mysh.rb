class Mysh < Formula
  desc "MySQL connection manager with SSH tunnel support"
  homepage "https://github.com/atani/mysh"
  version "0.9.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/atani/mysh/releases/download/v0.9.1/mysh-darwin-amd64"
      sha256 "2163878adf0739f2890b8db0f1b13f234ab3f5ea8837eaf6f87eaf50b3428872"
    else
      url "https://github.com/atani/mysh/releases/download/v0.9.1/mysh-darwin-arm64"
      sha256 "56bbcb95a5dc45825446d7efc73a0b447ee0be5c5c87b44c6bd39adf6529bd18"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/atani/mysh/releases/download/v0.9.1/mysh-linux-amd64"
      sha256 "df9adefe5808e481c71bd61f47d947d804666b116741d09610026737348e21ac"
    else
      url "https://github.com/atani/mysh/releases/download/v0.9.1/mysh-linux-arm64"
      sha256 "e747fe36400e1382aeebbd3ae4632fe9dcdc324337be44c580438cc237269dfb"
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
