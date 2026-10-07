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
      url "https://github.com/theazz/awless-ro/releases/download/v0.2.3/awless-ro-darwin-arm64.tar.gz"
      sha256 "5773910feaa219527fc86ebd73affd1735fd1ee0b72288b23a342618f9929a9e"
    end
    on_intel do
      url "https://github.com/theazz/awless-ro/releases/download/v0.2.3/awless-ro-darwin-amd64.tar.gz"
      sha256 "9e53184b772be47245a35b0f956bb20879b99265fce6cd1fea2040cb1ac5a930"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/theazz/awless-ro/releases/download/v0.2.3/awless-ro-linux-arm64.tar.gz"
      sha256 "124a80a1771fbb7652f7954c65fbc441a29f5571b5227eee1765367b702c842b"
    end
    on_intel do
      url "https://github.com/theazz/awless-ro/releases/download/v0.2.3/awless-ro-linux-amd64.tar.gz"
      sha256 "6833752e3c06bfa11fb1e8d5d06c014e5f1c3cb65a190a412dc01d8ce7c7596b"
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
