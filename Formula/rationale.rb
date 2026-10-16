# Written by bin/release in jorgebasilio/rationale-client; do not edit by hand.
class Rationale < Formula
  desc "Rationale local client: your agents' decisions, captured and brought back at the moment of change"
  homepage "https://rationalehq.com"
  version "0.12.16"

  on_macos do
    url "https://app.rationalehq.com/client/0.12.16/darwin-universal"
    sha256 "f51f36327f0312d3402bf0a122ec68bd2abbd9b440260fe57a511980bd5ea8b8"
  end

  on_linux do
    on_intel do
      url "https://app.rationalehq.com/client/0.12.16/linux-x86_64"
      sha256 "38c69537681a387b8c7032f9711281b04428f5c22cc9b1da86db319c2839ad0b"
    end
    on_arm do
      url "https://app.rationalehq.com/client/0.12.16/linux-arm64"
      sha256 "16bb87e93e3f7c6a71f9f519ed36cef831fccbd3d91c5f79a62a7ca2c39932a5"
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
