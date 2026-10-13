# Written by bin/release in jorgebasilio/rationale-client; do not edit by hand.
class Rationale < Formula
  desc "Rationale local client: your agents' decisions, captured and brought back at the moment of change"
  homepage "https://rationalehq.com"
  version "0.12.14"

  on_macos do
    url "https://app.rationalehq.com/client/0.12.14/darwin-universal"
    sha256 "0931172b2e18cb80dd2ce0de750213b84fb88e369aaa12e4b305d46d9854356c"
  end

  on_linux do
    on_intel do
      url "https://app.rationalehq.com/client/0.12.14/linux-x86_64"
      sha256 "81ce5149f029b8ebe15e6dc28688d4ba15b1b0c0d12e7b98d6aed153963532a9"
    end
    on_arm do
      url "https://app.rationalehq.com/client/0.12.14/linux-arm64"
      sha256 "f82f50ebb47a21618d37729e863804a8a8abcb3395c38f578f74cb0f31b33e2e"
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
