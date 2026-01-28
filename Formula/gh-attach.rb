class GhAttach < Formula
  desc "Upload images to GitHub Issue/PR comments"
  homepage "https://github.com/atani/gh-attach"
  url "https://github.com/atani/gh-attach/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "5ea35593d201841d49b5dc0c17e176558f3dc1c4957ce835f0c8cebacc122db3"
  license "MIT"

  depends_on "gh"
  depends_on "node"

  def install
    # Install playwright-cli locally to avoid global npm issues
    system "npm", "install", "--prefix", libexec, "@playwright/mcp"
    bin.install "bin/gh-attach"
  end

  def caveats
    <<~EOS
      First run: login to GitHub in browser (one time only):
        gh-attach --issue 1 --image ./test.png --headed

      Then use normally:
        gh-attach --issue 123 --image ./screenshot.png
    EOS
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/gh-attach --help")
  end
end
