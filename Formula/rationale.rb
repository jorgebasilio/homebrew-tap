# Written by bin/release in jorgebasilio/rationale-client; do not edit by hand.
class Rationale < Formula
  desc "Rationale local client: your agents' decisions, captured and brought back at the moment of change"
  homepage "https://rationalehq.com"
  version "0.10.0"

  on_macos do
    url "https://app.rationalehq.com/client/0.10.0/darwin-universal"
    sha256 "00cf96338358a952cd32090c754b5bc5d2620cbfada680e0be5bdaadc3c47618"
  end

  on_linux do
    on_intel do
      url "https://app.rationalehq.com/client/0.10.0/linux-x86_64"
      sha256 "54282b41268c4fcebdd22f15ee0a4e97f18b77eb0d10d7453376596d09191eae"
    end
    on_arm do
      url "https://app.rationalehq.com/client/0.10.0/linux-arm64"
      sha256 "461e7370c9711468f29c70ad383dc0fde1d2dc4a5e7f68b0aeeb57b7b00b7244"
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
