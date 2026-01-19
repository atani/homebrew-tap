class Glowm < Formula
  desc "Glow-like Markdown CLI with Mermaid diagrams (iTerm2/Kitty inline images + PDF)"
  homepage "https://github.com/atani/glowm"
  license "MIT"
  version "0.2.1"

  on_macos do
    on_intel do
      url "https://github.com/atani/glowm/releases/download/v0.2.1/glowm_0.2.1_darwin_amd64.tar.gz"
      sha256 "73f69bbfb9e7dffb5d026c8b153bc8594a8287684c7cd153d3893bfc97b88424"
    end
    on_arm do
      url "https://github.com/atani/glowm/releases/download/v0.2.1/glowm_0.2.1_darwin_arm64.tar.gz"
      sha256 "fde5d76743c472977e913f002f6e4d5c1378499a53eb449518ee4b59bfd271c0"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/atani/glowm/releases/download/v0.2.1/glowm_0.2.1_linux_amd64.tar.gz"
      sha256 "1b1ce5566a1baba5875a2d8b8043e72b844120282ce7a44f3f9d66d63674ecab"
    end
    on_arm do
      url "https://github.com/atani/glowm/releases/download/v0.2.1/glowm_0.2.1_linux_arm64.tar.gz"
      sha256 "c46a56b26e140c6b33034785d8b61d32742e120fdda1c9d2c5195fdd55e570bc"
    end
  end

  def install
    bin.install "glowm"
  end

  test do
    system "#{bin}/glowm", "--version"
  end
end
