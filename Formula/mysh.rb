class Mysh < Formula
  desc "MySQL connection manager with SSH tunnel support"
  homepage "https://github.com/atani/mysh"
  url "https://github.com/atani/mysh/archive/refs/tags/v0.0.8.tar.gz"
  sha256 "5bf312051a24e66965d14f62d2af5a60cd50071597d6b39acc6483ff9ae974d1"

  depends_on "go" => :build

  def install
    ldflags = "-s -w -X main.version=#{version}"
    system "go", "build", *std_go_args(ldflags: ldflags)
  end

  test do
    assert_match "mysh - MySQL connection manager", shell_output("#{bin}/mysh help")
  end
end
