class Maude < Formula
  desc "Tmux-backed claude -p compatibility shim"
  homepage "https://github.com/dorkitude/maude"
  url "https://github.com/dorkitude/maude/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "63e50553f61d131ebbcd1e28ce15fcd70488f3a9bf6dfdd8fc1452c8e9b56025"
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
