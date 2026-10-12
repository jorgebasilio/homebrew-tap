# Written by bin/release in jorgebasilio/rationale-client; do not edit by hand.
class Rationale < Formula
  desc "Rationale local client: your agents' decisions, captured and brought back at the moment of change"
  homepage "https://rationalehq.com"
  version "0.12.7"

  on_macos do
    url "https://app.rationalehq.com/client/0.12.7/darwin-universal"
    sha256 "eafa190827a2e8d49e3ea8667f41af36d3ab43785fb3ed7185a970915f04128c"
  end

  on_linux do
    on_intel do
      url "https://app.rationalehq.com/client/0.12.7/linux-x86_64"
      sha256 "ff3195ac4b6ba0daa6df3c8c2d67e9f3d7d2a704ebe2f389162e67274c6ee8bf"
    end
    on_arm do
      url "https://app.rationalehq.com/client/0.12.7/linux-arm64"
      sha256 "f12e78ce6d6f4d8aa61bcc76209836f515f946db9b5c88ab6175ea822a95fd86"
    end
  end

  def install
    # The one downloaded file (named after the URL's last segment).
    binary = Dir["*"].find { |f| File.file?(f) }
    chmod 0755, binary
    bin.install binary => "rationale"
  end

  def caveats
    <<~EOS
      Homebrew installs update with Homebrew: brew upgrade rationale
      (rationale status says when a newer version exists). Next, in a repository your project lists:
        rationale init
    EOS
  end

  test do
    assert_equal "rationale-client #{version}", shell_output("#{bin}/rationale --version").strip
  end
end
