class Transit < Formula
  desc "Japan transit routes and station departures CLI"
  homepage "https://github.com/atani/transit"
  url "https://github.com/atani/transit/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "ebb23f42d5375f09d03413698e1b72e1fa52f7322691c66e8b3158bec77e42b5"
  license "MIT"
  head "https://github.com/atani/transit.git", branch: "main"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w -X main.version=#{version}"), "./cmd/transit"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/transit version")
  end
end
