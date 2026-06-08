class Ctxpack < Formula
  include Language::Python::Virtualenv

  desc "Token-aware context extraction for AI agents"
  homepage "https://github.com/atani/ctxpack"
  url "https://github.com/atani/ctxpack/archive/refs/tags/ctxpack-v0.2.0.tar.gz"
  sha256 "5eb995a8c220a6c9e11cec5ccbd9a65447152ac5b3777c237dc5f9e3b51f8c45"
  license "MIT"
  head "https://github.com/atani/ctxpack.git", branch: "main"

  depends_on "python@3.13"

  def install
    virtualenv_install_with_resources
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ctxpack --version")
  end
end
