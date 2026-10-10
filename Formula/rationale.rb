# Written by bin/release in jorgebasilio/rationale-client; do not edit by hand.
class Rationale < Formula
  desc "Rationale local client: your agents' decisions, captured and brought back at the moment of change"
  homepage "https://rationalehq.com"
  version "0.12.6"

  on_macos do
    url "https://app.rationalehq.com/client/0.12.6/darwin-universal"
    sha256 "a72360410da0a2c4fc3a6f711bc9993be71fff52cf7f268353ba743fe6d9547d"
  end

  on_linux do
    on_intel do
      url "https://app.rationalehq.com/client/0.12.6/linux-x86_64"
      sha256 "c7711fac00bc900bf1273ee7957e2ecc561c0320ef03e9fe48846d840cfbc1a2"
    end
    on_arm do
      url "https://app.rationalehq.com/client/0.12.6/linux-arm64"
      sha256 "3848ddcfed05da4da35578627f4d5d89fd4b338f72735f8231feec9b8ab15fe0"
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
