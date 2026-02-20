class GhAttach < Formula
  desc "Upload images to GitHub Issue/PR comments"
  homepage "https://github.com/atani/gh-attach"
  url "https://github.com/atani/gh-attach/archive/refs/tags/v0.6.1.tar.gz"
  sha256 "56300ea9f60ebb26f7c586772d9c528315c37d8898cb6d85e2e637f81e819a63"
  license "MIT"

  depends_on "gh"
  depends_on "jq"
  depends_on "node"

  def install
    # Install playwright-cli locally to avoid global npm issues
    system "npm", "install", "--prefix", libexec, "@playwright/cli"
    bin.install "bin/gh-attach"
  end

  def caveats
    <<~EOS
      Usage modes:

      1. Release mode (no browser needed):
         gh-attach --issue 123 --image ./screenshot.png --release

      2. Direct mode (auto for configured hosts):
         echo "direct_hosts=your-ghe-host.com" > ~/.config/gh-attach/config
         gh-attach --issue 123 --image ./screenshot.png --host your-ghe-host.com

      3. Browser mode (requires one-time login):
         gh-attach --issue 1 --image ./test.png --headed
         Then use normally:
         gh-attach --issue 123 --image ./screenshot.png
    EOS
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/gh-attach --help")
  end
end
