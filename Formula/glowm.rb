class Glowm < Formula
  desc "Glow-like Markdown CLI with Mermaid diagrams (iTerm2/Kitty inline images + PDF)"
  homepage "https://github.com/atani/glowm"
  url "https://github.com/atani/glowm/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "487861731cca9b40e7c59e36d4c211e7f9f8620368bdf895964799f9bb19be49"
  version "0.1.1"

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
