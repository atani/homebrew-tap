class Mysh < Formula
  desc "MySQL connection manager with SSH tunnel support"
  homepage "https://github.com/atani/mysh"
  url "https://github.com/atani/mysh/archive/refs/tags/v0.0.6.tar.gz"
  sha256 "b69717c0a6022179c80778227e5a4d08e3c3c8a53d8175d82ae59324cf917517"

  depends_on "go" => :build

  def install
    ldflags = "-s -w -X main.version=#{version}"
    system "go", "build", *std_go_args(ldflags: ldflags)
  end

  test do
    assert_match "mysh - MySQL connection manager", shell_output("#{bin}/mysh help")
  end
end
