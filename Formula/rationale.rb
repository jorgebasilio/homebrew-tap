# Written by bin/release in jorgebasilio/rationale-client; do not edit by hand.
class Rationale < Formula
  desc "Rationale local client: your agents' decisions, captured and brought back at the moment of change"
  homepage "https://rationalehq.com"
  version "0.15.2"

  on_macos do
    url "https://app.rationalehq.com/client/0.15.2/darwin-universal"
    sha256 "8efd2a21a2fc5899575dece31b475045984913dab08c4ffad26df696d8701f10"
  end

  on_linux do
    on_intel do
      url "https://app.rationalehq.com/client/0.15.2/linux-x86_64"
      sha256 "d817d555f8cd7b404773c794292cfd85fb9c9880da572b1d54e2089d88ef45a8"
    end
    on_arm do
      url "https://app.rationalehq.com/client/0.15.2/linux-arm64"
      sha256 "c020569cab35c7f791cdd56255afea76c6ed17fee1599639cd20e67486353749"
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
