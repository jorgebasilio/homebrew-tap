# Written by bin/release in jorgebasilio/rationale-client; do not edit by hand.
class Rationale < Formula
  desc "Rationale local client: your agents' decisions, captured and brought back at the moment of change"
  homepage "https://rationalehq.com"
  version "0.8.0"

  on_macos do
    url "https://rationalehq.com/client/0.8.0/darwin-universal"
    sha256 "a554dba967cc197df07a293d38dcc1215d317a8875cc7f6a2e9420c5b6714ce2"
  end

  on_linux do
    on_intel do
      url "https://rationalehq.com/client/0.8.0/linux-x86_64"
      sha256 "3fad622c58d94c8623b4bd03f274d6b3a05081934161fc1ce83109065d6c6c82"
    end
    on_arm do
      url "https://rationalehq.com/client/0.8.0/linux-arm64"
      sha256 "cf62794d081021a06c30aef33cbc7fb1986605b4ccef17fda055e2c1cfd7bfa6"
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
