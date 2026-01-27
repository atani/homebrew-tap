class GhAttach < Formula
  desc "Upload images to GitHub Issue/PR comments"
  homepage "https://github.com/atani/gh-attach"
  url "https://github.com/atani/gh-attach/archive/refs/heads/main.tar.gz"
  version "0.2.0"
  license "MIT"

  depends_on "gh"
  depends_on "node"

  def install
    bin.install "bin/gh-attach"
  end

  def post_install
    system "npm", "install", "-g", "@playwright/mcp"
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
