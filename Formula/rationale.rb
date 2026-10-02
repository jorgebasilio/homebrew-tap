# Written by bin/release in jorgebasilio/rationale-client; do not edit by hand.
class Rationale < Formula
  desc "Rationale local client: your agents' decisions, captured and brought back at the moment of change"
  homepage "https://rationalehq.com"
  version "0.5.1"

  on_macos do
    url "https://rationalehq.com/client/0.5.1/darwin-universal"
    sha256 "07de6337c5bd89062989d7b5656bd88f69ea9afe314ee3ab0c4dc029680bf7b8"
  end

  on_linux do
    on_intel do
      url "https://rationalehq.com/client/0.5.1/linux-x86_64"
      sha256 "057e8d27f0891076bcd06d3f99ca9537015de8da4405248260d46a7057c1a719"
    end
    on_arm do
      url "https://rationalehq.com/client/0.5.1/linux-arm64"
      sha256 "4fd53e07a8c99e3effdc365fd8e43fdbcbccea389f635c1913974a4b701f4d12"
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
