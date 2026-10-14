# Written by bin/release in jorgebasilio/rationale-client; do not edit by hand.
class Rationale < Formula
  desc "Rationale local client: your agents' decisions, captured and brought back at the moment of change"
  homepage "https://rationalehq.com"
  version "0.12.15"

  on_macos do
    url "https://app.rationalehq.com/client/0.12.15/darwin-universal"
    sha256 "fcb1ee5d2e6152e1d770814564158769a2170551726b8270a5e6b3d745bfee2b"
  end

  on_linux do
    on_intel do
      url "https://app.rationalehq.com/client/0.12.15/linux-x86_64"
      sha256 "fb219eafa8fcaaf87e347dc5633b89caf2286ac45cbb6cd466330d5c1339c61e"
    end
    on_arm do
      url "https://app.rationalehq.com/client/0.12.15/linux-arm64"
      sha256 "346bf1123a6a4b4698f1177cb716fb77c8371b605a5b47c18a82b765d1dd27a3"
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
