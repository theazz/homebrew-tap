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
      url "https://github.com/theazz/awless-ro/releases/download/v0.2.2/awless-ro-darwin-arm64.tar.gz"
      sha256 "ad1926f6ffe33acdfb06894be54159e96d68900909925603594841d8659d746e"
    end
    on_intel do
      url "https://github.com/theazz/awless-ro/releases/download/v0.2.2/awless-ro-darwin-amd64.tar.gz"
      sha256 "557875db61a3e8ecbe7894b5418975bf72041921a59911e28d8b17a8a90f28fa"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/theazz/awless-ro/releases/download/v0.2.2/awless-ro-linux-arm64.tar.gz"
      sha256 "4006845136438e1364c8fc36fc1456dc3e486b69eebc60300569610c133a93e5"
    end
    on_intel do
      url "https://github.com/theazz/awless-ro/releases/download/v0.2.2/awless-ro-linux-amd64.tar.gz"
      sha256 "6c93aded4985e4c4efd91c205ed0cb724863070e92320a4d2066071bd67dd1b8"
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
