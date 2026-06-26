class Transit < Formula
  desc "Japan transit routes and station departures CLI"
  homepage "https://github.com/atani/transit"
  url "https://github.com/atani/transit/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "7ef9defed2aa4d38d29218a8621155c3a259a9afa68993abed7d0abedddeec3a"
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
