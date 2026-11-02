class Am < Formula
  desc "Apple Music in the terminal"
  homepage "https://github.com/IIxauII/am"
  url "https://github.com/IIxauII/am/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "97b469d75196de31e37518ec2d104986286cdab6b05a4371267f55b8a7920c81"
  license "GPL-3.0-only"

  # Pin "zig@0.17" once Homebrew's zig moves past 0.17.
  depends_on "zig" => :build

  on_macos do
    # Zig 0.17 builds for macOS 15 or later.
    depends_on macos: :sequoia
  end

  deny_network_access!

  def install
    # ReleaseSafe, like am's release binaries.
    system "zig", "build", *std_zig_args(release_mode: :safe)
  end

  def caveats
    <<~EOS
      am plays through headless Firefox or Google Chrome, so one of them must be installed.
      On macOS:
        brew install --cask firefox
      On Linux, install one from your distribution.
    EOS
  end

  test do
    assert_equal "am #{version}", shell_output("#{bin}/am --version").strip
  end
end
