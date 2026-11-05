# Written by bin/release in jorgebasilio/rationale-client; do not edit by hand.
class Rationale < Formula
  desc "Rationale local client: your agents' decisions, captured and brought back at the moment of change"
  homepage "https://rationalehq.com"
  version "0.14.0"

  on_macos do
    url "https://app.rationalehq.com/client/0.14.0/darwin-universal"
    sha256 "386f99a0a2f07788b20ee14c9d52c52e82ed0080a0c7ee54ac5c8ceaa8e6159a"
  end

  on_linux do
    on_intel do
      url "https://app.rationalehq.com/client/0.14.0/linux-x86_64"
      sha256 "5d2a3b7f4a7505d984ef97b2a744af430b57d4e75aa11d0eecd77ac308cf4b22"
    end
    on_arm do
      url "https://app.rationalehq.com/client/0.14.0/linux-arm64"
      sha256 "86584947a1f4d06cf0eeed025d6740bdf56f8608696e577fa301d75aa432ac3f"
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
