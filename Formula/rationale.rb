# Written by bin/release in jorgebasilio/rationale-client; do not edit by hand.
class Rationale < Formula
  desc "Rationale local client: your agents' decisions, captured and brought back at the moment of change"
  homepage "https://rationalehq.com"
  version "0.12.3"

  on_macos do
    url "https://app.rationalehq.com/client/0.12.3/darwin-universal"
    sha256 "be3a5f06f36b6685f3683496120f7e3c9508031bbd7e244efa081a70acc1ea7c"
  end

  on_linux do
    on_intel do
      url "https://app.rationalehq.com/client/0.12.3/linux-x86_64"
      sha256 "5746be2f85eab8085f71612fa829b313ebfe7e80604f62217190316f49d6d8e7"
    end
    on_arm do
      url "https://app.rationalehq.com/client/0.12.3/linux-arm64"
      sha256 "171fc45ffa2079253fa1a1102088c13cba27e91865a4037ef736cc4c6185e8f1"
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
