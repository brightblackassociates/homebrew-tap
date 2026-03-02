class BlackjackRoguelite < Formula
  desc "Blackjack roguelite card combat game for the terminal"
  homepage "https://github.com/brightblackassociates/blackjack-roguelite"
  url "https://github.com/brightblackassociates/blackjack-roguelite/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "0fbc9a234d0390a838b872adeacb0ec1211217605449402fa32b98c04d9678d8"

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
