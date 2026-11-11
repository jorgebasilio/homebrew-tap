# Written by bin/release in jorgebasilio/rationale-client; do not edit by hand.
class Rationale < Formula
  desc "Rationale local client: your agents' decisions, captured and brought back at the moment of change"
  homepage "https://rationalehq.com"
  version "0.15.3"

  on_macos do
    url "https://app.rationalehq.com/client/0.15.3/darwin-universal"
    sha256 "3cf470f2bb6ec8a6820d66e7a6a19309a9d92ad700f50e00350e2b0754ba3b62"
  end

  on_linux do
    on_intel do
      url "https://app.rationalehq.com/client/0.15.3/linux-x86_64"
      sha256 "0463a2a41ed8c9a0e8f7e62c8ec4eb554aee639313c676780cf2243213b37ce3"
    end
    on_arm do
      url "https://app.rationalehq.com/client/0.15.3/linux-arm64"
      sha256 "d7d53a80653461dad4d99b0e165423238e34a8cc2a70bd1497ec6f6adf5da1e8"
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
