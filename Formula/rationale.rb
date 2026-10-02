# Written by bin/release in jorgebasilio/rationale-client; do not edit by hand.
class Rationale < Formula
  desc "Rationale local client: your agents' decisions, captured and brought back at the moment of change"
  homepage "https://rationalehq.com"
  version "0.6.0"

  on_macos do
    url "https://rationalehq.com/client/0.6.0/darwin-universal"
    sha256 "2d0769dba3898521bb615011cd4e5b6b156d1ed2ee54dd755068bc66cd446bc3"
  end

  on_linux do
    on_intel do
      url "https://rationalehq.com/client/0.6.0/linux-x86_64"
      sha256 "95b79db19bb693f35cf611b2c7b96850f8e18568ce511475e8557f080c92d295"
    end
    on_arm do
      url "https://rationalehq.com/client/0.6.0/linux-arm64"
      sha256 "bb84b173676ee0def6af11ce9a6785700dc244afd5b154605808eb335e297c26"
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
