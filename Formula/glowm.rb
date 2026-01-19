class Glowm < Formula
  desc "Glow-like Markdown CLI with Mermaid diagrams (iTerm2/Kitty inline images + PDF)"
  homepage "https://github.com/atani/glowm"
  url "https://github.com/atani/glowm/archive/refs/tags/v0.1.2.tar.gz"
  sha256 "4a6d55c9bf2c4987824eec98372a946e95143fe7202f762ad3ec44ab7f388c8d"
  version "0.1.2"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w"), "./cmd/glowm"
  end

  test do
    (testpath/"sample.md").write("# Hello\n\nworld\n")
    output = shell_output("#{bin}/glowm #{testpath}/sample.md")
    assert_match "Hello", output
  end
end
