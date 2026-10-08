# Written by bin/release in jorgebasilio/rationale-client; do not edit by hand.
class Rationale < Formula
  desc "Rationale local client: your agents' decisions, captured and brought back at the moment of change"
  homepage "https://rationalehq.com"
  version "0.12.2"

  on_macos do
    url "https://app.rationalehq.com/client/0.12.2/darwin-universal"
    sha256 "54cb79d10ee95bbf5d922b7780e6dd7c1bad6c51689af8aa531b3eb166034a3e"
  end

  on_linux do
    on_intel do
      url "https://app.rationalehq.com/client/0.12.2/linux-x86_64"
      sha256 "f71fd4174712ae8caf58af5b7510d9d85742917c252fbf633fc1157d1f488dab"
    end
    on_arm do
      url "https://app.rationalehq.com/client/0.12.2/linux-arm64"
      sha256 "92dd78a9cea464538fa4b7afc18622ac52cddc7b13239da6a2768f9082b6a804"
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
