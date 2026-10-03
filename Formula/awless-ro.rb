class AwlessRo < Formula
  desc "Read-only AWS CLI: readable listings, resources by name, relations"
  homepage "https://github.com/theazz/awless-ro"
  license "Apache-2.0"

  livecheck do
    url :stable
    strategy :github_latest
  end

  # The binaries are the ones published with the GitHub release: built by Actions
  # from the tag after the tests and govulncheck pass, and listed in its SHA256SUMS.
  on_macos do
    on_arm do
      url "https://github.com/theazz/awless-ro/releases/download/v0.2.0/awless-ro-darwin-arm64.tar.gz"
      sha256 "6ec136ba723efb99d55e0031d2e58630bcbf099538937e5031f22748e1e4f261"
    end
    on_intel do
      url "https://github.com/theazz/awless-ro/releases/download/v0.2.0/awless-ro-darwin-amd64.tar.gz"
      sha256 "1e64d6c88272ba69751912883b5220a152c19e32e05b45a4b6355edf545d8370"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/theazz/awless-ro/releases/download/v0.2.0/awless-ro-linux-arm64.tar.gz"
      sha256 "35a1924920229bb123dc63c5a64410af3ebfa29e4454136d50f3eecde403bde1"
    end
    on_intel do
      url "https://github.com/theazz/awless-ro/releases/download/v0.2.0/awless-ro-linux-amd64.tar.gz"
      sha256 "535592edbada3b973729e187bb79de00b9a95d3c1bee4aeae9222abfcea9868c"
    end
  end

  def install
    bin.install "awless-ro"
    generate_completions_from_executable(bin/"awless-ro", "completion")
  end

  test do
    assert_match "awless-ro v#{version}", shell_output("#{bin}/awless-ro version")
  end
end
