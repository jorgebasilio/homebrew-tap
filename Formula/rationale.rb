# Written by bin/release in jorgebasilio/rationale-client; do not edit by hand.
class Rationale < Formula
  desc "Rationale local client: your agents' decisions, captured and brought back at the moment of change"
  homepage "https://rationalehq.com"
  version "0.13.2"

  on_macos do
    url "https://app.rationalehq.com/client/0.13.2/darwin-universal"
    sha256 "e3b8df6260503b02c8ee03c3df8f040c0f623b6dc1f1b14cf64b15d578040f3f"
  end

  on_linux do
    on_intel do
      url "https://app.rationalehq.com/client/0.13.2/linux-x86_64"
      sha256 "42fc444fce3c1e964759fb461a56807d396c4ac39f4141df0bc5594dbd51c9c1"
    end
    on_arm do
      url "https://app.rationalehq.com/client/0.13.2/linux-arm64"
      sha256 "2bb4881d0436c977958bbd199f950ac5d61c247c2f16c3eddb0fc5ec8db15165"
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
