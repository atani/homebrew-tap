class Transit < Formula
  desc "Japan transit routes and station departures CLI"
  homepage "https://github.com/atani/transit"
  url "https://github.com/atani/transit/archive/refs/tags/v0.3.2.tar.gz"
  sha256 "49695ce31536693a06fdedbe1b90411d14cc88ffb4ad372fb6d0e36da409a81e"
  license "MIT"
  head "https://github.com/atani/transit.git", branch: "main"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w -X main.version=#{version}"), "./cmd/transit"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/transit --version")
  end
end
