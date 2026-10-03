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
      url "https://github.com/theazz/awless-ro/releases/download/v0.1.0/awless-ro-darwin-arm64.tar.gz"
      sha256 "86ea84424e7d1e3c91f5aaf2e01ce0ede12e3a184b8f2ba476eba2f978ec2016"
    end
    on_intel do
      url "https://github.com/theazz/awless-ro/releases/download/v0.1.0/awless-ro-darwin-amd64.tar.gz"
      sha256 "660304aac950deac4e9bc62338df6d12e953dbf5556775b22f21a2e61ab389f9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/theazz/awless-ro/releases/download/v0.1.0/awless-ro-linux-arm64.tar.gz"
      sha256 "d108f4c1329e654825c7bc2c5ad644cf7c65a44aaa5f15e511e7908afdae3e6c"
    end
    on_intel do
      url "https://github.com/theazz/awless-ro/releases/download/v0.1.0/awless-ro-linux-amd64.tar.gz"
      sha256 "d6da84c8bc4d12e195427868f8bc4a60b0711935198d8eba427581651ba29af4"
    end
  end

  def install
    bin.install "awless-ro"
    # zsh and fish are left out until the completion command emits scripts those
    # shells can autoload: today's zsh output is meant to be sourced, not installed.
    generate_completions_from_executable(bin/"awless-ro", "completion", shells: [:bash])
  end

  test do
    assert_match "awless-ro v#{version}", shell_output("#{bin}/awless-ro version")
  end
end
