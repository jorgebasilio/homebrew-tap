# Written by bin/release in jorgebasilio/rationale-client; do not edit by hand.
class Rationale < Formula
  desc "Rationale local client: your agents' decisions, captured and brought back at the moment of change"
  homepage "https://rationalehq.com"
  version "0.12.1"

  on_macos do
    url "https://app.rationalehq.com/client/0.12.1/darwin-universal"
    sha256 "1055695a36d0103338cc24cce6072470168e726efa0bc62c23665c54df847913"
  end

  on_linux do
    on_intel do
      url "https://app.rationalehq.com/client/0.12.1/linux-x86_64"
      sha256 "142085351c679abfd5bea92359348c5c0dca9f8f3f87e35e90831a8e0be059ba"
    end
    on_arm do
      url "https://app.rationalehq.com/client/0.12.1/linux-arm64"
      sha256 "831a50e39fd55305c6390db3e85796bb507a703b9bf32f069f244c8bc59553a0"
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
