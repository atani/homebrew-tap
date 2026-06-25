class Transit < Formula
  desc "Japan transit routes and station departures CLI"
  homepage "https://github.com/atani/transit"
  url "https://github.com/atani/transit/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "f41dae1d8e150ddc51853da7b695bfa7c4058cd074bda047076fd6c892192f6c"
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
