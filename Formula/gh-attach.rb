class GhAttach < Formula
  desc "Upload images to GitHub Issue/PR comments"
  homepage "https://github.com/atani/gh-attach"
  url "https://github.com/atani/gh-attach/archive/refs/tags/v0.5.0.tar.gz"
  sha256 "2b96f378f245b6bf9ab518058d4a8e888ad5403b5d93a9f913c0aa9651cf9be6"
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
