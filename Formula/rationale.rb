# Written by bin/release in jorgebasilio/rationale-client; do not edit by hand.
class Rationale < Formula
  desc "Rationale local client: your agents' decisions, captured and brought back at the moment of change"
  homepage "https://rationalehq.com"
  version "0.9.0"

  on_macos do
    url "https://app.rationalehq.com/client/0.9.0/darwin-universal"
    sha256 "ebd619fd4f0907f092cd0f26b8bf70bc62808c976fc655776cda012b92b999b4"
  end

  on_linux do
    on_intel do
      url "https://app.rationalehq.com/client/0.9.0/linux-x86_64"
      sha256 "d013c22b733e82a00c83b3933963141b588e523a554c69129de26f483e9bf6f7"
    end
    on_arm do
      url "https://app.rationalehq.com/client/0.9.0/linux-arm64"
      sha256 "5aaec3d25e085282c0265de7fb7ee14145bfb8ace88a4872c190e7f459ca7df5"
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
