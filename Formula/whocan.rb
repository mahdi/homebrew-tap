class Whocan < Formula
  desc "One screen for every macOS privacy permission your terminal has"
  homepage "https://github.com/mahdi/whocan"
  url "https://github.com/mahdi/whocan/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "45e43934ddc8ce987dccf5c7df5260b95d4a891cd709e39409e6939423398c21"
  license "MIT"

  depends_on xcode: ["14.0", :build]
  depends_on :macos

  def install
    system "swift", "build", "--disable-sandbox", "-c", "release"
    bin.install ".build/release/whocan"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/whocan --version")
  end
end
