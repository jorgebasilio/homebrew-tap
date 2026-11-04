# Written by bin/release in jorgebasilio/rationale-client; do not edit by hand.
class Rationale < Formula
  desc "Rationale local client: your agents' decisions, captured and brought back at the moment of change"
  homepage "https://rationalehq.com"
  version "0.13.3"

  on_macos do
    url "https://app.rationalehq.com/client/0.13.3/darwin-universal"
    sha256 "280405e3888834a08bc43fe85e446cfc4897d83f22a0945300eecdd46041b720"
  end

  on_linux do
    on_intel do
      url "https://app.rationalehq.com/client/0.13.3/linux-x86_64"
      sha256 "6d96d8cbd4830fc1e34fd53df099a743aebe83a7e1131e9bd2179d6da6e6cdb7"
    end
    on_arm do
      url "https://app.rationalehq.com/client/0.13.3/linux-arm64"
      sha256 "565005792a589dda718bf98c67688e252aa2040e2fd05c616f4edc61097b6a2e"
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
