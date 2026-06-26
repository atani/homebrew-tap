class Transit < Formula
  desc "Japan transit routes and station departures CLI"
  homepage "https://github.com/atani/transit"
  url "https://github.com/atani/transit/archive/refs/tags/v0.3.1.tar.gz"
  sha256 "502dcfcb3fbbbabab12b8e7d059d317972eb5cb17325765a4e537feb2715f891"
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
