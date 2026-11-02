class Am < Formula
  desc "Apple Music in the terminal"
  homepage "https://github.com/IIxauII/am"
  url "https://github.com/IIxauII/am/archive/d5dbd4e5502780064c948e3a2cc47c2d582f567c.tar.gz"
  version "0.1.0"
  sha256 "db3013f1c5752fcfe757b0d3650559569f055fd1de94123bb2fdd7753e54c906"
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
