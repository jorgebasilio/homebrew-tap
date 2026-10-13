# Written by bin/release in jorgebasilio/rationale-client; do not edit by hand.
class Rationale < Formula
  desc "Rationale local client: your agents' decisions, captured and brought back at the moment of change"
  homepage "https://rationalehq.com"
  version "0.12.11"

  on_macos do
    url "https://app.rationalehq.com/client/0.12.11/darwin-universal"
    sha256 "1520bcc7eea86b33f83681783be3eb70cec933f31c7e865dbdeb9f833ea68ad5"
  end

  on_linux do
    on_intel do
      url "https://app.rationalehq.com/client/0.12.11/linux-x86_64"
      sha256 "85ac0e8dda3ebd8bc5298c19293e90d517c0cfa99058cfb52754c76166711a6c"
    end
    on_arm do
      url "https://app.rationalehq.com/client/0.12.11/linux-arm64"
      sha256 "4e2abed544dd6c2a10fb2a2dd1d4c03f30c8fd430412bfc3c520bc48fa63f13f"
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
