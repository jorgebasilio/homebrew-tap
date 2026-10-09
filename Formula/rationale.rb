# Written by bin/release in jorgebasilio/rationale-client; do not edit by hand.
class Rationale < Formula
  desc "Rationale local client: your agents' decisions, captured and brought back at the moment of change"
  homepage "https://rationalehq.com"
  version "0.12.4"

  on_macos do
    url "https://app.rationalehq.com/client/0.12.4/darwin-universal"
    sha256 "cdeeb817798071a298db945440f241ef8ed1c8d2d2d11b23d4cf77b898772389"
  end

  on_linux do
    on_intel do
      url "https://app.rationalehq.com/client/0.12.4/linux-x86_64"
      sha256 "c3889134a21a8d6609584d68921eae57e973c3171a8f01e66efa10e83dd1a678"
    end
    on_arm do
      url "https://app.rationalehq.com/client/0.12.4/linux-arm64"
      sha256 "6d272b412fc413d8c3d93c32fd63bee85c68489b660118545ef2acecd467e62b"
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
