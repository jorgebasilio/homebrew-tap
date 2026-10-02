# Written by bin/release in jorgebasilio/rationale-client; do not edit by hand.
class Rationale < Formula
  desc "Rationale local client: your agents' decisions, captured and brought back at the moment of change"
  homepage "https://rationalehq.com"
  version "0.6.1"

  on_macos do
    url "https://rationalehq.com/client/0.6.1/darwin-universal"
    sha256 "c79d552d45d6000f396a365be487fbe7be6ccb02dfc4d9e44282764aac6a83e2"
  end

  on_linux do
    on_intel do
      url "https://rationalehq.com/client/0.6.1/linux-x86_64"
      sha256 "426a54149e4a7b23211b36f7f7fe1ae1247af5a4ae0ebc2ce52b9c35307bd51f"
    end
    on_arm do
      url "https://rationalehq.com/client/0.6.1/linux-arm64"
      sha256 "551644b5c9708af15cd8905c61b0d9576cbcee16a609dc74f7a82e4e05e12808"
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
