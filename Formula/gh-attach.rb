# typed: false
# frozen_string_literal: true

class GhAttach < Formula
  desc "Upload images to GitHub Issue/PR comments (works on github.com and GHE)"
  homepage "https://github.com/atani/gh-attach"
  url "https://github.com/atani/gh-attach/archive/refs/tags/v0.7.0.tar.gz"
  sha256 "52bee73618bfbeb27929f0e3e7a6f61a41a7c5d067a078ab0305296e4945fd57"
  version "0.7.0"
  license "MIT"

  depends_on "gh"
  depends_on "node" => :optional
  depends_on "jq" => :optional

  def install
    bin.install "bin/gh-attach"
  end

  def caveats
    <<~EOS
      gh-attach needs playwright-cli for browser/direct upload modes:

        npm install -g @playwright/mcp

      For hosts behind SSO (eg. GitHub Enterprise with SAML), log in once
      against a named persistent session, then reuse it:

        playwright-cli --session ghe open --persistent https://ghe.example.com
        gh-attach --session ghe --keep-session --browser ...

      See https://github.com/atani/gh-attach#readme for full usage.
    EOS
  end

  test do
    assert_match "gh-attach #{version}", shell_output("#{bin}/gh-attach --version")
  end
end
