class Lazyccg < Formula
  desc "TUI dashboard for monitoring Claude Code / Codex / Gemini sessions in kitty terminal"
  homepage "https://github.com/atani/lazyccg"
  url "https://github.com/atani/lazyccg/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "f23ae975415467c44cbcd49df98bf6290106d3f62ac7413929954313c6dbb997"
  license "MIT"
  head "https://github.com/atani/lazyccg.git", branch: "main"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w"), "./cmd/lazyccg"
  end

  test do
    assert_match "poll interval", shell_output("#{bin}/lazyccg -h 2>&1", 2)
  end
end
