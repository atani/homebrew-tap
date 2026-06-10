class Ctxpack < Formula
  desc "Token-aware context extraction for AI agents"
  homepage "https://github.com/atani/ctxpack"
  url "https://github.com/atani/ctxpack/archive/refs/tags/ctxpack-v0.3.0.tar.gz"
  sha256 "1214a1066ec9f06d4b4e6aafa894953c3122e2a469003f42f765b7d9167ec39c"
  license "MIT"
  head "https://github.com/atani/ctxpack.git", branch: "main"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w -X main.version=#{version}"), "./cmd/ctxpack"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ctxpack --version")
  end
end
