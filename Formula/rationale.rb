# Written by bin/release in jorgebasilio/rationale-client; do not edit by hand.
class Rationale < Formula
  desc "Rationale local client: your agents' decisions, captured and brought back at the moment of change"
  homepage "https://rationalehq.com"
  version "0.13.1"

  on_macos do
    url "https://app.rationalehq.com/client/0.13.1/darwin-universal"
    sha256 "fa96cf68af507bac6c801d6e0d0223aed3d7db284661c20cc120b3b2e6c054ae"
  end

  on_linux do
    on_intel do
      url "https://app.rationalehq.com/client/0.13.1/linux-x86_64"
      sha256 "acc05ef6c9ffb7a448b60e58c4a54970adcbef1871d70e6288b5e4aba6ae7d4b"
    end
    on_arm do
      url "https://app.rationalehq.com/client/0.13.1/linux-arm64"
      sha256 "3a48035cbc5202fe80d8f262f039efc50050ece21878b12ff5fbe1c03513bd0b"
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
