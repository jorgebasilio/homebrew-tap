# Written by bin/release in jorgebasilio/rationale-client; do not edit by hand.
class Rationale < Formula
  desc "Rationale local client: your agents' decisions, captured and brought back at the moment of change"
  homepage "https://rationalehq.com"
  version "0.14.1"

  on_macos do
    url "https://app.rationalehq.com/client/0.14.1/darwin-universal"
    sha256 "a032a294d6e9c9e0c06e93094ae2ff68f28f71f9655657345cba8a57c70c0d8f"
  end

  on_linux do
    on_intel do
      url "https://app.rationalehq.com/client/0.14.1/linux-x86_64"
      sha256 "d86d816f08a4c97edb7fda61447f4a015b36499a462b515ae71ecf7c993f8dc8"
    end
    on_arm do
      url "https://app.rationalehq.com/client/0.14.1/linux-arm64"
      sha256 "68124dbf470b0cb4941033159dc078776c3e5ae0ca13de5ce6a2f34c4aec68de"
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
