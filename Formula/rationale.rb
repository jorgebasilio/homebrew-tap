# Written by bin/release in jorgebasilio/rationale-client; do not edit by hand.
class Rationale < Formula
  desc "Rationale local client: your agents' decisions, captured and brought back at the moment of change"
  homepage "https://rationalehq.com"
  version "0.6.2"

  on_macos do
    url "https://rationalehq.com/client/0.6.2/darwin-universal"
    sha256 "46864ded816ea00747e86566e3ffac6451783cb1dd04c3b2cf6a921af949def4"
  end

  on_linux do
    on_intel do
      url "https://rationalehq.com/client/0.6.2/linux-x86_64"
      sha256 "8e5d9b9f305728e5e3d2f1e6851c9646e55d4f51913f71e3ff949c7e3ba9e999"
    end
    on_arm do
      url "https://rationalehq.com/client/0.6.2/linux-arm64"
      sha256 "b09a8befa3d396e00304866bb4b485c58451dcffeb08ab51cbc930127722b92a"
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
