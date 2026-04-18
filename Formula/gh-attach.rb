# typed: false
# frozen_string_literal: true

class GhAttach < Formula
  desc "Upload images to GitHub Issue/PR comments (works on github.com and GHE)"
  homepage "https://github.com/atani/gh-attach"
  url "https://github.com/atani/gh-attach/archive/refs/tags/v0.7.2.tar.gz"
  sha256 "f65f6a946ee2f2c37a36a59ec6cf777e592c52c6e2b2118ee81e2d6ac68680a1"
  version "0.7.1"
  license "MIT"

  depends_on "gh"
  depends_on "jq"

  def install
    bin.install "bin/gh-attach"
  end

  def caveats
    <<~EOS
      gh-attach drives a real browser via playwright-cli. Install it once
      into your own npm global prefix so the session store is shared
      across gh-attach invocations (bundling it per-install would create
      a separate ms-playwright daemon cache, so a SAML login from one
      install would not carry over to another):

        npm install -g @playwright/cli

      For hosts behind SSO (eg. GitHub Enterprise with SAML), log in once
      against a named persistent session, then reuse it:

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
