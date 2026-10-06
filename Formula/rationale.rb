# Written by bin/release in jorgebasilio/rationale-client; do not edit by hand.
class Rationale < Formula
  desc "Rationale local client: your agents' decisions, captured and brought back at the moment of change"
  homepage "https://rationalehq.com"
  version "0.10.2"

  on_macos do
    url "https://app.rationalehq.com/client/0.10.2/darwin-universal"
    sha256 "546408716e171ebb95a82e822d99195367fecbcfac8f0694ab56aace08b553f3"
  end

  on_linux do
    on_intel do
      url "https://app.rationalehq.com/client/0.10.2/linux-x86_64"
      sha256 "f581877f215849385f194f95f71e4fd8806bc5412d1effe7a1ec47d313bf026e"
    end
    on_arm do
      url "https://app.rationalehq.com/client/0.10.2/linux-arm64"
      sha256 "056183a041027486341934a50955109e03ba7fb469480897b52d513416ab6f2e"
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
