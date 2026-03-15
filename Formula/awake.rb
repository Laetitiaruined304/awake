class Awake < Formula
  desc "macOS CLI + TUI utility to keep your Mac awake"
  homepage "https://github.com/VolksRat71/awake"
  version "1.0.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/VolksRat71/awake/releases/download/v1.0.1/awake-v1.0.1-darwin-arm64.tar.gz"
      sha256 "3b988de6257c13a1498ba548927d633ae1f9b92ad2c07484714b4bf2ae5a8acf"
    else
      url "https://github.com/VolksRat71/awake/releases/download/v1.0.1/awake-v1.0.1-darwin-amd64.tar.gz"
      sha256 "54a28a1420781d904e4cb0dfdc118e615ca8dcf9e92c62c17417ee6f51647a16"
    end
  end

  depends_on :macos
  depends_on "terminal-notifier" => :recommended

  def install
    bin.install "awake"
  end

  def post_install
    system bin/"awake", "install"
  end

  def caveats
    <<~EOS
      The daemon and notifications were set up automatically.

      To start a session:
        awake 60            # 60 minutes
        awake until 17:00   # until 5 PM
        awake               # open the TUI
    EOS
  end

  test do
    assert_match "Keep your Mac awake", shell_output("#{bin}/awake --help")
  end
end
