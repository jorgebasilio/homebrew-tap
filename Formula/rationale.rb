# Written by bin/release in jorgebasilio/rationale-client; do not edit by hand.
class Rationale < Formula
  desc "Rationale local client: your agents' decisions, captured and brought back at the moment of change"
  homepage "https://rationalehq.com"
  version "0.12.13"

  on_macos do
    url "https://app.rationalehq.com/client/0.12.13/darwin-universal"
    sha256 "0030788e9c10cefa7ecb4a1fb2c0d4e0f1a80aa9104cdafbffb9939ad30f2a05"
  end

  on_linux do
    on_intel do
      url "https://app.rationalehq.com/client/0.12.13/linux-x86_64"
      sha256 "a6d530d44bc716af7f05db549eb8050ff4aa817ec09d89af7b09332800db7749"
    end
    on_arm do
      url "https://app.rationalehq.com/client/0.12.13/linux-arm64"
      sha256 "c3c7239b828adeebea7f7e38ea5945f83cbf0288939c9f41565f8045c362ca16"
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
