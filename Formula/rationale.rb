# Written by bin/release in jorgebasilio/rationale-client; do not edit by hand.
class Rationale < Formula
  desc "Rationale local client: your agents' decisions, captured and brought back at the moment of change"
  homepage "https://rationalehq.com"
  version "0.5.0"

  on_macos do
    url "https://rationalehq.com/client/0.5.0/darwin-universal"
    sha256 "072abdfb9059f9b2998b6899a0a8b06d2a82ee7610888f5c816fa139057c1993"
  end

  on_linux do
    on_intel do
      url "https://rationalehq.com/client/0.5.0/linux-x86_64"
      sha256 "baa47b665ed149ccaa838f440909c4c899f2ff9141ab0a8b464c6d2fe3761c3d"
    end
    on_arm do
      url "https://rationalehq.com/client/0.5.0/linux-arm64"
      sha256 "6fb6681923efde855ed11d91c1151c6f134ec1f1522567f280a61f4f5731bf53"
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
