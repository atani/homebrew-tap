class Mysh < Formula
  desc "MySQL connection manager with SSH tunnel support"
  homepage "https://github.com/atani/mysh"
  version "0.3.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/atani/mysh/releases/download/v0.3.0/mysh-darwin-amd64"
      sha256 "96f8cf3c0d205285bfa0cb2266e421eff18ae311ba29737338bed65704b4ab72"
    else
      url "https://github.com/atani/mysh/releases/download/v0.3.0/mysh-darwin-arm64"
      sha256 "09c6013459cd6cd8541ac40b8181a63b9407483f1a4627f2847cdf0a9ea64e49"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/atani/mysh/releases/download/v0.3.0/mysh-linux-amd64"
      sha256 "b798582ac3e71301d81ef58c72f9291470fbc8e0192a7476f529f2bab269fef4"
    else
      url "https://github.com/atani/mysh/releases/download/v0.3.0/mysh-linux-arm64"
      sha256 "e4c97bd34785d7b07669c677638890c4de034568223da6bf2e8a16b3b4f743ff"
    end
  end

  def install
    bin.install "mysh" => "mysh"
  end

  test do
    assert_match "mysh", shell_output("#{bin}/mysh help")
  end
end
