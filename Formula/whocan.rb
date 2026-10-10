class Whocan < Formula
  desc "One screen for every macOS privacy permission your terminal has"
  homepage "https://github.com/mahdi/whocan"
  url "https://github.com/mahdi/whocan/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "566886bc5cf2170215c45800b475adda46615aeec78d8552f5d74f44d6ed49ef"
  license "MIT"

  depends_on xcode: ["15.0", :build]
  depends_on :macos

  def install
    system "swift", "build", "--disable-sandbox", "-c", "release"
    bin.install ".build/release/whocan"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/whocan --version")

    output = shell_output("#{bin}/whocan --json")
    assert_match "\"key\" : \"accessibility\"", output
    refute_match "\e[", shell_output("#{bin}/whocan")
  end
end
