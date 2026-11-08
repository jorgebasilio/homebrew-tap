# Written by bin/release in jorgebasilio/rationale-client; do not edit by hand.
class Rationale < Formula
  desc "Rationale local client: your agents' decisions, captured and brought back at the moment of change"
  homepage "https://rationalehq.com"
  version "0.15.0"

  on_macos do
    url "https://app.rationalehq.com/client/0.15.0/darwin-universal"
    sha256 "9dda58e15742d3185dd045ae7aeff3c35aec1ab29fdd89c9c9360acaec8e0d9b"
  end

  on_linux do
    on_intel do
      url "https://app.rationalehq.com/client/0.15.0/linux-x86_64"
      sha256 "2f55f843f8934c96a07b9bed6c1ca4b5f6be65629683a0f517746933fe1a6a56"
    end
    on_arm do
      url "https://app.rationalehq.com/client/0.15.0/linux-arm64"
      sha256 "045fab18415bbcb622fc912fee0e42da4d2cc19b29da2fc74a6cc4fda906cce9"
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
