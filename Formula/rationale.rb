# Written by bin/release in jorgebasilio/rationale-client; do not edit by hand.
class Rationale < Formula
  desc "Rationale local client: your agents' decisions, captured and brought back at the moment of change"
  homepage "https://rationalehq.com"
  version "0.12.9"

  on_macos do
    url "https://app.rationalehq.com/client/0.12.9/darwin-universal"
    sha256 "c0e497d2528d9a59b9a88ef903dbcb84b0f09741998af1771c42050e9120af48"
  end

  on_linux do
    on_intel do
      url "https://app.rationalehq.com/client/0.12.9/linux-x86_64"
      sha256 "e54d52c62d511ea30134d566ea0454ab37e3b6ebc2dda50ae641145e3a3f744d"
    end
    on_arm do
      url "https://app.rationalehq.com/client/0.12.9/linux-arm64"
      sha256 "f12d276322ffff5dd4e005799664c8796a863c42ab0d3eac677e7bad2d9456b6"
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
