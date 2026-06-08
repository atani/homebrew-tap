class Ctxpack < Formula
  include Language::Python::Virtualenv

  desc "Token-aware context extraction for AI agents"
  homepage "https://github.com/atani/ctxpack"
  url "https://github.com/atani/ctxpack/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "b1c55138d450fcbdc0965357d33b3b86d6a877551866e4801399a58923bd50e2"
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
