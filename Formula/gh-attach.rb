class GhAttach < Formula
  desc "Upload images to GitHub Issue/PR comments"
  homepage "https://github.com/atani/gh-attach"
  url "https://github.com/atani/gh-attach/archive/refs/tags/v0.5.1.tar.gz"
  sha256 "72e611d900af52078f4bd55580eb475c599721fa47dcb9e330eb26be7d97076f"
  license "MIT"

  depends_on "gh"
  depends_on "node"

  def install
    # Install playwright-cli locally to avoid global npm issues
    system "npm", "install", "--prefix", libexec, "@playwright/cli"
    bin.install "bin/gh-attach"
  end

  def caveats
    <<~EOS
      Usage modes:

      1. Release mode (recommended for GHE/SSO):
         gh-attach --issue 123 --image ./screenshot.png --release

      2. Browser mode (requires one-time login):
         gh-attach --issue 1 --image ./test.png --headed
         Then use normally:
         gh-attach --issue 123 --image ./screenshot.png
    EOS
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/gh-attach --help")
  end
end
