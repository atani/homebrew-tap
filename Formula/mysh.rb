class Mysh < Formula
  desc "MySQL connection manager with SSH tunnel support"
  homepage "https://github.com/atani/mysh"
  url "https://github.com/atani/mysh/archive/refs/tags/v0.0.7.tar.gz"
  sha256 "120874b5cdf16fc96672990a8915f5330beb4dd7cfb7a94a7e42a6e6d1573ad3"

  depends_on "go" => :build

  def install
    ldflags = "-s -w -X main.version=#{version}"
    system "go", "build", *std_go_args(ldflags: ldflags)
  end

  test do
    assert_match "mysh - MySQL connection manager", shell_output("#{bin}/mysh help")
  end
end
