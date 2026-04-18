# typed: false
# frozen_string_literal: true

class GhAttach < Formula
  desc "Upload images to GitHub Issue/PR comments (works on github.com and GHE)"
  homepage "https://github.com/atani/gh-attach"
  url "https://github.com/atani/gh-attach/archive/refs/tags/v0.7.1.tar.gz"
  sha256 "f25e333d74af3c1ef26c54ca95837564a04eb1d093163de2a6fb390bb82b7eec"
  version "0.7.1"
  license "MIT"

  depends_on "gh"
  depends_on "jq"
  depends_on "node"

  def install
    # Install the script into libexec so its sibling ../libexec lookup resolves,
    # and bundle playwright-cli under libexec/node_modules so a single
    # `brew install` gives a working setup (no separate npm install needed).
    libexec.install "bin/gh-attach"
    system Formula["node"].opt_bin/"npm", "install", "--prefix", libexec, "@playwright/cli"
    (bin/"gh-attach").write_env_script libexec/"gh-attach",
      PATH: "#{libexec}/node_modules/.bin:$PATH"
  end

  def caveats
    <<~EOS
      For hosts behind SSO (eg. GitHub Enterprise with SAML), log in once
      against a named persistent playwright-cli session and reuse it:

        playwright-cli --session ghe open --persistent https://ghe.example.com
        gh-attach --session ghe --keep-session --browser --url-only \\
          --host ghe.example.com --repo owner/repo --issue 1 --image a.png

      See https://github.com/atani/gh-attach#readme for full usage.
    EOS
  end

  test do
    assert_match "gh-attach #{version}", shell_output("#{bin}/gh-attach --version")
  end
end
