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
      url "https://github.com/theazz/awless-ro/releases/download/v0.5.0/awless-ro-darwin-arm64.tar.gz"
      sha256 "895a0b08603df3d6a474513e3c589232d65b8883bedc5c77bb06b275bc578408"
    end
    on_intel do
      url "https://github.com/theazz/awless-ro/releases/download/v0.5.0/awless-ro-darwin-amd64.tar.gz"
      sha256 "a2c701e89f6189e140ebaa5cc0fab4fbac99ef5dd9924d6eac0c925bef8549dc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/theazz/awless-ro/releases/download/v0.5.0/awless-ro-linux-arm64.tar.gz"
      sha256 "9b0a58b78c0afbe307b05d57fd882014935b43ed3d3261880e9be11bbdf504b6"
    end
    on_intel do
      url "https://github.com/theazz/awless-ro/releases/download/v0.5.0/awless-ro-linux-amd64.tar.gz"
      sha256 "3e231adfedaab60a79612b8510ab9e397c0d4fff22571c9c6201b4c13f691f52"
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
