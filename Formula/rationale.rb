# Written by bin/release in jorgebasilio/rationale-client; do not edit by hand.
class Rationale < Formula
  desc "Rationale local client: your agents' decisions, captured and brought back at the moment of change"
  homepage "https://rationalehq.com"
  version "0.8.1"

  on_macos do
    url "https://rationalehq.com/client/0.8.1/darwin-universal"
    sha256 "ff5a5858a2859810cb0b2d6765ce0998f65bd8d47434b1bb12ffc08abe1754dc"
  end

  on_linux do
    on_intel do
      url "https://rationalehq.com/client/0.8.1/linux-x86_64"
      sha256 "217b0b08b16eb4cec03f0adbb2dd7cfcf911d8e90330ee050753f08f3d185b26"
    end
    on_arm do
      url "https://rationalehq.com/client/0.8.1/linux-arm64"
      sha256 "d555e605491da304f904a0903303bed193f30bae0992baabd21545eecdac5f7d"
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
