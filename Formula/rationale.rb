# Written by bin/release in jorgebasilio/rationale-client; do not edit by hand.
class Rationale < Formula
  desc "Rationale local client: your agents' decisions, captured and brought back at the moment of change"
  homepage "https://rationalehq.com"
  version "0.12.10"

  on_macos do
    url "https://app.rationalehq.com/client/0.12.10/darwin-universal"
    sha256 "b808a2e4100dcc2c7141efc2c751e93196795b81756bb84ac148ad8aa3c8e18a"
  end

  on_linux do
    on_intel do
      url "https://app.rationalehq.com/client/0.12.10/linux-x86_64"
      sha256 "37900833619a64005ca6c5f29d785df132f661bd5557a6f4d5947a9a5bef95c2"
    end
    on_arm do
      url "https://app.rationalehq.com/client/0.12.10/linux-arm64"
      sha256 "8e21cc820e3eeee233af891fe2be23d1e10a9f6435050917b6fcd40db218159b"
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
