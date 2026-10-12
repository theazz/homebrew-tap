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
      url "https://github.com/theazz/awless-ro/releases/download/v0.4.0/awless-ro-darwin-arm64.tar.gz"
      sha256 "2afbfd9a5cf550e38ff86f54a2610d86e4c932a031ee9745f7b195fbd17b14d8"
    end
    on_intel do
      url "https://github.com/theazz/awless-ro/releases/download/v0.4.0/awless-ro-darwin-amd64.tar.gz"
      sha256 "7cbdd9b662d15e667c3ffbf4484d2f5f6b3e2ef5946ba16b22e3f192ffe08510"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/theazz/awless-ro/releases/download/v0.4.0/awless-ro-linux-arm64.tar.gz"
      sha256 "946f9454174ee983520fc4f7422b6bcf8c494137f09b5ac3e402bc5c036c614c"
    end
    on_intel do
      url "https://github.com/theazz/awless-ro/releases/download/v0.4.0/awless-ro-linux-amd64.tar.gz"
      sha256 "102c2461d7a5c71748f7b5bddd4471d7a2b6b1494bd6553ada23b2c42946298e"
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
