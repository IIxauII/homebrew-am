class Am < Formula
  desc "Apple Music in the terminal"
  homepage "https://github.com/IIxauII/am"
  url "https://github.com/IIxauII/am/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "97b469d75196de31e37518ec2d104986286cdab6b05a4371267f55b8a7920c81"
  license "GPL-3.0-only"

  bottle do
    root_url "https://github.com/IIxauII/homebrew-am/releases/download/am-0.1.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "2236ca559c7a2b0b1bf3c55b286c977d58a9712e9240f93825efafaa9392a9ce"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "a0d94259bb70942d9b6d9e07851bcb8c2e2d58079d16c8ca07664b9ef9f9fb4e"
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
