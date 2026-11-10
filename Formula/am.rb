class Am < Formula
  desc "Apple Music in the terminal"
  homepage "https://github.com/IIxauII/am"
  url "https://github.com/IIxauII/am/archive/refs/tags/v0.5.2.tar.gz"
  sha256 "030c794b81d7057af0953fbeedf9fd0a37cc678099cfd35e9b5d03f7f0fdb23e"
  license "GPL-3.0-only"

  bottle do
    root_url "https://github.com/IIxauII/homebrew-am/releases/download/am-0.5.2"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "b0e80a30227c800bbc25a02eb80689e72b1e3836d18b611f3cd00d89d3001e9e"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "4a815a6cf68db83a598f49dbc654301b206225e6ea33517ffa639d182317f6ba"
  end

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
