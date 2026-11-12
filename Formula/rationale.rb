# Written by bin/release in jorgebasilio/rationale-client; do not edit by hand.
class Rationale < Formula
  desc "Rationale local client: your agents' decisions, captured and brought back at the moment of change"
  homepage "https://rationalehq.com"
  version "0.16.0"

  on_macos do
    url "https://app.rationalehq.com/client/0.16.0/darwin-universal"
    sha256 "d6e45a578ce71ae5f6d9a79b96f663909c0396fc78133839cc8e0fecc09e6f96"
  end

  on_linux do
    on_intel do
      url "https://app.rationalehq.com/client/0.16.0/linux-x86_64"
      sha256 "59e64b0252c8e7546191eb8b6c71460ba4094f9d9350430bc033088b4587bfeb"
    end
    on_arm do
      url "https://app.rationalehq.com/client/0.16.0/linux-arm64"
      sha256 "067f04968d7f5132902ed08413490d2ebcd05458c950c97d54ec700ab9281630"
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
