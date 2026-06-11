class Macconvert < Formula
  desc "Convert files from Finder's right-click menu - 45 native Quick Actions"
  homepage "https://github.com/pehqge/macconvert"
  url "https://github.com/pehqge/macconvert/archive/refs/tags/v1.2.0.tar.gz"
  sha256 "934bc101c087986c9be18b095899a75e0db99c1bf7a2f8290ab98031ce6040e0"
  license "MIT"

  depends_on :macos

  def install
    libexec.install Dir["*"]
    bin.write_exec_script libexec/"bin/macconvert"
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
