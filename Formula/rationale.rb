# Written by bin/release in jorgebasilio/rationale-client; do not edit by hand.
class Rationale < Formula
  desc "Rationale local client: your agents' decisions, captured and brought back at the moment of change"
  homepage "https://rationalehq.com"
  version "0.15.1"

  on_macos do
    url "https://app.rationalehq.com/client/0.15.1/darwin-universal"
    sha256 "45c96bbe41a7b20b18cf606b8e0b7428e12e59a18cd13b828e9a97743c4621b6"
  end

  on_linux do
    on_intel do
      url "https://app.rationalehq.com/client/0.15.1/linux-x86_64"
      sha256 "82af307526df2d4c8630dd351238489823c735ca4e27ce41368f07d7bb46b0b6"
    end
    on_arm do
      url "https://app.rationalehq.com/client/0.15.1/linux-arm64"
      sha256 "5f2fb3e41d79fc1f1a263e771e33b33214ae818428237f8268ccf7cd467c99b1"
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
