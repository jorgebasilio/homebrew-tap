# Written by bin/release in jorgebasilio/rationale-client; do not edit by hand.
class Rationale < Formula
  desc "Rationale local client: your agents' decisions, captured and brought back at the moment of change"
  homepage "https://rationalehq.com"
  version "0.11.0"

  on_macos do
    url "https://app.rationalehq.com/client/0.11.0/darwin-universal"
    sha256 "9afd4fcb06011d6a5bd47a74154c589b32010a118bf5045598133c67670c8f3e"
  end

  on_linux do
    on_intel do
      url "https://app.rationalehq.com/client/0.11.0/linux-x86_64"
      sha256 "cb75a422281d4310b0dddd1ae7760c2aa1e52ebe8478e061998a9bb5b435b6a9"
    end
    on_arm do
      url "https://app.rationalehq.com/client/0.11.0/linux-arm64"
      sha256 "ed34c0467fb48fdbea782f29068392f6446e3daf0ac52e1eebda14e1503018e8"
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
