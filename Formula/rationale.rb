# Written by bin/release in jorgebasilio/rationale-client; do not edit by hand.
class Rationale < Formula
  desc "Rationale local client: your agents' decisions, captured and brought back at the moment of change"
  homepage "https://rationalehq.com"
  version "0.7.0"

  on_macos do
    url "https://rationalehq.com/client/0.7.0/darwin-universal"
    sha256 "ad13a43905c1ed3f6d59f3e63beb2777ea58c70ff8d2b7bc3231050c00ca07ff"
  end

  on_linux do
    on_intel do
      url "https://rationalehq.com/client/0.7.0/linux-x86_64"
      sha256 "c68889a1d46d8bbb1114a17cb933d2ed08ab14294983ef92e76b43f738467ea4"
    end
    on_arm do
      url "https://rationalehq.com/client/0.7.0/linux-arm64"
      sha256 "fac15d5c0f8013cd3c42f57059847a9ab5af007adab2fdfba5ee2274582ca348"
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
