# Written by bin/release in jorgebasilio/rationale-client; do not edit by hand.
class Rationale < Formula
  desc "Rationale local client: your agents' decisions, captured and brought back at the moment of change"
  homepage "https://rationalehq.com"
  version "0.8.6"

  on_macos do
    url "https://app.rationalehq.com/client/0.8.6/darwin-universal"
    sha256 "9a7b51c80b11010856f94e43e96bc93ab01b4c9b20e5d98d3e5af816c45d7303"
  end

  on_linux do
    on_intel do
      url "https://app.rationalehq.com/client/0.8.6/linux-x86_64"
      sha256 "fc48a484dc2309120968e536f609848a7e8bbbf8cbb69b79af08283f50c94746"
    end
    on_arm do
      url "https://app.rationalehq.com/client/0.8.6/linux-arm64"
      sha256 "3df37343e92ac51714b1ceea25a7ac681235d5569f26424d32fafafde528f764"
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
