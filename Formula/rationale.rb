# Written by bin/release in jorgebasilio/rationale-client; do not edit by hand.
class Rationale < Formula
  desc "Rationale local client: your agents' decisions, captured and brought back at the moment of change"
  homepage "https://rationalehq.com"
  version "0.12.8"

  on_macos do
    url "https://app.rationalehq.com/client/0.12.8/darwin-universal"
    sha256 "c39afb6b5f9806e3b6d2a780f2da0c5a0067585d4646d541c6b17717f2b85d4b"
  end

  on_linux do
    on_intel do
      url "https://app.rationalehq.com/client/0.12.8/linux-x86_64"
      sha256 "d01cb1d0821636d0d61944d73437c32105daadf292d2ab11852990a4cde683a6"
    end
    on_arm do
      url "https://app.rationalehq.com/client/0.12.8/linux-arm64"
      sha256 "ad42a159e8235dbf9b6d1a4e1165902773ef4c00830774c15998064e9d143e15"
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
