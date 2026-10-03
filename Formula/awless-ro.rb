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
      url "https://github.com/theazz/awless-ro/releases/download/v0.2.1/awless-ro-darwin-arm64.tar.gz"
      sha256 "5238dc1c0716170c3dfc1dfeff7de82c5482ad07d6a3709f41e2545808af93f1"
    end
    on_intel do
      url "https://github.com/theazz/awless-ro/releases/download/v0.2.1/awless-ro-darwin-amd64.tar.gz"
      sha256 "872eab66b62a8ba63358e6ccd8f38424409072b2e53e9892142d9c432ae157a7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/theazz/awless-ro/releases/download/v0.2.1/awless-ro-linux-arm64.tar.gz"
      sha256 "d00fa05701453fc07c1fc3416c15eb0b3d824ad527854bd14e93eca027d304b6"
    end
    on_intel do
      url "https://github.com/theazz/awless-ro/releases/download/v0.2.1/awless-ro-linux-amd64.tar.gz"
      sha256 "1fbb7d7a80dea699747f136473246aec130fa162c9ab8670531eac1c1542000e"
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
