class Mysh < Formula
  desc "MySQL connection manager with SSH tunnel support"
  homepage "https://github.com/atani/mysh"
  url "https://github.com/atani/mysh/archive/refs/tags/v0.0.3.tar.gz"
  sha256 "82bb3227c12438ed71b4414687f52b704c16747e25e6949500cd0bb4edfc022b"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w")
  end

  test do
    assert_match "mysh - MySQL connection manager", shell_output("#{bin}/mysh help")
  end
end
