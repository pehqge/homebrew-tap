class Macconvert < Formula
  desc "Convert files from Finder's right-click menu - 45 native Quick Actions"
  homepage "https://github.com/pehqge/macconvert"
  url "https://github.com/pehqge/macconvert/archive/refs/tags/v1.1.1.tar.gz"
  sha256 "33fd148769bc71ab385006d67d039d2c73f07ac1e924c5f221fbf5617c192249"
  license "MIT"

  depends_on :macos

  def install
    libexec.install Dir["*"]
    (bin/"macconvert").write_exec_script libexec/"bin/macconvert"
  end

  def caveats
    <<~EOS
      To choose which Quick Actions appear in Finder, run:
        macconvert setup
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/macconvert version")
  end
end
