# Written by bin/release in jorgebasilio/rationale-client; do not edit by hand.
class Rationale < Formula
  desc "Rationale local client: your agents' decisions, captured and brought back at the moment of change"
  homepage "https://rationalehq.com"
  version "0.8.4"

  on_macos do
    url "https://rationalehq.com/client/0.8.4/darwin-universal"
    sha256 "b3a559a693c22af32292db9b0317becd1bc5cb8ab6c80774d27a8c5287fbc0ae"
  end

  on_linux do
    on_intel do
      url "https://rationalehq.com/client/0.8.4/linux-x86_64"
      sha256 "7fe8692b9b04b040c3bb5d38dbedcb30bd2497fb391114d67d8a49bcc8c34f18"
    end
    on_arm do
      url "https://rationalehq.com/client/0.8.4/linux-arm64"
      sha256 "c023b4a30ac9ccd955433da719d2d15e5cc593b6c10349226188135c4110f6ad"
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
