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
      url "https://github.com/theazz/awless-ro/releases/download/v0.3.0/awless-ro-darwin-arm64.tar.gz"
      sha256 "32505d3124b55e7780b3ab8c0c29d30aaf70a36b942f2023349e59d1a6d5d0b6"
    end
    on_intel do
      url "https://github.com/theazz/awless-ro/releases/download/v0.3.0/awless-ro-darwin-amd64.tar.gz"
      sha256 "0f537e6a43ff9f272bdd8b810cebb8761d8a75133e6ac5de4b4643f8d14803d7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/theazz/awless-ro/releases/download/v0.3.0/awless-ro-linux-arm64.tar.gz"
      sha256 "d5ba63fcbc09011439224c09227f01849614c4a4d9cae31e9480ad3ee71eb871"
    end
    on_intel do
      url "https://github.com/theazz/awless-ro/releases/download/v0.3.0/awless-ro-linux-amd64.tar.gz"
      sha256 "083244a01cd254b9a2e05875e66a1d63261aeb96b5f93e54892ae6f0e4388e7c"
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
