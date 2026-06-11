class Ctxpack < Formula
  desc "Token-aware context extraction for AI agents"
  homepage "https://github.com/atani/ctxpack"
  url "https://github.com/atani/ctxpack/archive/refs/tags/ctxpack-v0.4.0.tar.gz"
  sha256 "84b4cb94feedbedbdf0e7ec4812841aea9c4986023c57be57f225f8b8fbfdcdc"
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
