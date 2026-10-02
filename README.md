# Rationale Homebrew tap

The [Rationale](https://rationalehq.com) client for Homebrew, and the signed release files it and the installer download. There is no source code here.

```sh
brew tap rationalehq/tap https://github.com/jorgebasilio/homebrew-tap
brew install rationalehq/tap/rationale
rationale init        # in a repository your project lists
```

Or, without Homebrew: `curl -fsSL https://rationalehq.com/install.sh | sh`.

Homebrew installs update with `brew upgrade rationale` (`rationale status` says when a newer version exists); installs from the script update themselves.

Each release holds one universal macOS binary, static Linux binaries for x86_64 and arm64, and `manifest.json` with each file's sha256, signed with minisign (`manifest.json.minisig`). The signing key is kept offline; the client verifies every update against the public keys built into it. `Formula/rationale.rb` and the releases are written only by the client's release script.
