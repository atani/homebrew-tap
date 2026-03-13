class Mysh < Formula
  desc "MySQL connection manager with SSH tunnel support"
  homepage "https://github.com/atani/mysh"
  url "https://github.com/atani/mysh/archive/refs/tags/v0.0.5.tar.gz"
  sha256 "c92ed62bceefe1854909888af52a0572c9ff268b7f5c280f9c852501f0a365e0"

  depends_on "go" => :build

  def install
    ldflags = "-s -w -X main.version=#{version}"
    system "go", "build", *std_go_args(ldflags: ldflags)
  end

  test do
    assert_match "mysh - MySQL connection manager", shell_output("#{bin}/mysh help")
  end
end
