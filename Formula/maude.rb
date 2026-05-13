class Maude < Formula
  desc "Tmux-backed claude -p compatibility shim"
  homepage "https://github.com/dorkitude/maude"
  url "https://github.com/dorkitude/maude/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "db3b2284e6ee1bc8dfc9548091193ebbcc91b2c451b54d9318749890259185a9"
  license "MIT"
  head "https://github.com/dorkitude/maude.git", branch: "main"

  depends_on "go" => :build
  depends_on "tmux"

  def install
    system "go", "build", *std_go_args(output: bin/"maude", ldflags: "-s -w"), "./cmd/maude"
  end

  test do
    assert_match "Route claude -p style prompts", shell_output("#{bin}/maude --help")
  end
end
