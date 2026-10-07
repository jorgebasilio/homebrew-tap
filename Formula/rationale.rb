# Written by bin/release in jorgebasilio/rationale-client; do not edit by hand.
class Rationale < Formula
  desc "Rationale local client: your agents' decisions, captured and brought back at the moment of change"
  homepage "https://rationalehq.com"
  version "0.12.0"

  on_macos do
    url "https://app.rationalehq.com/client/0.12.0/darwin-universal"
    sha256 "9822f792eba3ea47921e3ed04040ae1e2673092bcb75d0b863ee5f1aed8d93c9"
  end

  on_linux do
    on_intel do
      url "https://app.rationalehq.com/client/0.12.0/linux-x86_64"
      sha256 "5e026854b6bcdf7f73cabed6e98336d7bd8d182f3fedb237f098ac65402ed791"
    end
    on_arm do
      url "https://app.rationalehq.com/client/0.12.0/linux-arm64"
      sha256 "4f77a31a35b4d662a929dd85d41cd25345f68b85b09367cf3b810b23e26e2f3a"
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
