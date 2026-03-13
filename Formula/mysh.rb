class Mysh < Formula
  desc "MySQL connection manager with SSH tunnel support and AI-safe output masking"
  homepage "https://github.com/atani/mysh"
  url "https://github.com/atani/mysh/archive/refs/tags/v0.0.9.tar.gz"
  sha256 "79477fad2f7fc5a59105322b9c519172ce7f3ec8a6a69ad61368f44f62ed0884"
  head "https://github.com/atani/mysh.git", branch: "main"

  depends_on "go" => :build

  def install
    ldflags = "-s -w -X main.version=#{version}"
    system "go", "build", *std_go_args(ldflags: ldflags)
  end

  test do
    assert_match "MySQL connection manager", shell_output("#{bin}/mysh help")
  end
end
