# Written by bin/release in jorgebasilio/rationale-client; do not edit by hand.
class Rationale < Formula
  desc "Rationale local client: your agents' decisions, captured and brought back at the moment of change"
  homepage "https://rationalehq.com"
  version "0.10.1"

  on_macos do
    url "https://app.rationalehq.com/client/0.10.1/darwin-universal"
    sha256 "1ab12b0760a86e36c6416caa3baf528ae38fba741aa225b6c4a556e91b042ac4"
  end

  on_linux do
    on_intel do
      url "https://app.rationalehq.com/client/0.10.1/linux-x86_64"
      sha256 "5602d47681e33496ca39e80927c7468e4effc3907909589916da0f718175c83c"
    end
    on_arm do
      url "https://app.rationalehq.com/client/0.10.1/linux-arm64"
      sha256 "8970fe795b652ae30d106ccfe7d108bc3a26b877ee3453032e7d5cc9ec80124c"
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
