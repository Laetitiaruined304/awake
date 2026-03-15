class Awake < Formula
  desc "macOS CLI + TUI utility to keep your Mac awake"
  homepage "https://github.com/VolksRat71/awake"
  version "1.0.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/VolksRat71/awake/releases/download/v1.0.0/awake-v1.0.0-darwin-arm64.tar.gz"
      sha256 "7e89c51e3b902d7bdff225d9f187bcd866a6b6258f55d535d0a50167ba3c06f0"
    else
      url "https://github.com/VolksRat71/awake/releases/download/v1.0.0/awake-v1.0.0-darwin-amd64.tar.gz"
      sha256 "0e2fb9fc66b9b26d2df88ee3c37196ea1e178081e479acf68950ee59330f1cf7"
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
      The daemon and notification icon were set up automatically.

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
