# Written by bin/release in jorgebasilio/rationale-client; do not edit by hand.
class Rationale < Formula
  desc "Rationale local client: your agents' decisions, captured and brought back at the moment of change"
  homepage "https://rationalehq.com"
  version "0.12.5"

  on_macos do
    url "https://app.rationalehq.com/client/0.12.5/darwin-universal"
    sha256 "36263857a8535f5b5a9e02368459d50e5a2f7fa7a0cdb2586bc101599162f4eb"
  end

  on_linux do
    on_intel do
      url "https://app.rationalehq.com/client/0.12.5/linux-x86_64"
      sha256 "cf7a2a7ad2c62fdc28f7fe098772593b62716c04fc04c4b502088239f5e1d2f6"
    end
    on_arm do
      url "https://app.rationalehq.com/client/0.12.5/linux-arm64"
      sha256 "f101e945af6861404f581ea4d912661c17e02b3ee27ec3b1a7967b71c273217e"
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
