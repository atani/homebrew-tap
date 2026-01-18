class Glowm < Formula
  desc "Glow-like Markdown CLI with Mermaid diagrams (iTerm2/Kitty inline images + PDF)"
  homepage "https://github.com/atani/glowm"
  url "https://github.com/atani/glowm/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "76d3bf50234b64ce71938e3e7d3727871b5ecf6fc7d8165bd2470f8c0c0173bd"
  version "0.1.0"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args
  end

  test do
    (testpath/"sample.md").write("# Hello\n\nworld\n")
    output = shell_output("#{bin}/glowm #{testpath}/sample.md")
    assert_match "Hello", output
  end
end
