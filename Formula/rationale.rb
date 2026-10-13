# Written by bin/release in jorgebasilio/rationale-client; do not edit by hand.
class Rationale < Formula
  desc "Rationale local client: your agents' decisions, captured and brought back at the moment of change"
  homepage "https://rationalehq.com"
  version "0.12.12"

  on_macos do
    url "https://app.rationalehq.com/client/0.12.12/darwin-universal"
    sha256 "5d1386336c35ab7c5e743deca07a4508350152d510aa811f03df385ef847b04f"
  end

  on_linux do
    on_intel do
      url "https://app.rationalehq.com/client/0.12.12/linux-x86_64"
      sha256 "5ed27c38dd10c4eeab47973d5555102a14ef093876901d5923a165085e78b567"
    end
    on_arm do
      url "https://app.rationalehq.com/client/0.12.12/linux-arm64"
      sha256 "97e304696ddc725831ed273164e8f85430ad7049e8e94692d7d756ac4ed958b1"
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
