# Written by bin/release in jorgebasilio/rationale-client; do not edit by hand.
class Rationale < Formula
  desc "Rationale local client: your agents' decisions, captured and brought back at the moment of change"
  homepage "https://rationalehq.com"
  version "0.6.3"

  on_macos do
    url "https://rationalehq.com/client/0.6.3/darwin-universal"
    sha256 "62c89fadca514eb123fe2437e2990a01762ffc7fa3baaf253c9ba6143ce6d0d3"
  end

  on_linux do
    on_intel do
      url "https://rationalehq.com/client/0.6.3/linux-x86_64"
      sha256 "19d7d3de058ba35f8a578ab085724ad96e30e78b7cbe97eb028c3a6da1dba3ce"
    end
    on_arm do
      url "https://rationalehq.com/client/0.6.3/linux-arm64"
      sha256 "88ebba9798e45d8c9f4e7b110f08b5a4875b7fd4a7f21a3286f882f68f5a33b0"
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
