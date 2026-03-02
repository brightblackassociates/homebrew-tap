class BlackjackRoguelite < Formula
  desc "Blackjack roguelite card combat game for the terminal"
  homepage "https://github.com/brightblackassociates/blackjack-roguelite"
  url "https://github.com/brightblackassociates/blackjack-roguelite/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "11d87bc73eb78f1db616f1086c2654c30c0c978355771256ce798efe7e07867e"

  depends_on "python@3"

  def install
    libexec.install Dir["*.py"]
    (bin/"21").write <<~EOS
      #!/bin/bash
      exec "#{Formula["python@3"].opt_bin}/python3" "#{libexec}/play.py" "$@"
    EOS
  end

  test do
    assert_match "import engine", shell_output("cat #{libexec}/play.py")
  end
end
