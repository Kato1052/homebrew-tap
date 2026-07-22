# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://docs.brew.sh/rubydoc/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Nls < Formula
  desc "ls without month abbreviation."
  homepage "https://github.com/Kato1052/nls"
  version "0.0.10"
  license "MIT"

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/Kato1052/nls/releases/download/v0.0.10/nls-0.0.10_amd64_darwin.tar.gz"
    sha256 "92218c05994275818fd68c21200d5ec7bf71131a06c00877b8db28738e88c7c4"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Kato1052/nls/releases/download/v0.0.10/nls-0.0.10_amd64_linux.tar.gz"
    sha256 "8b2397bce9535a06a2b1416bf625a40067ce5c90ebeb64faea100f32cca7e656"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Kato1052/nls/releases/download/v0.0.10/nls-0.0.10_arm64_darwin.tar.gz"
    sha256 "31176ef6700f3bba23cde46a888262417c38a65764239efbb2efcc433af92b73"
  end
  if OS.linux? && Hardware::CPU.arm?
    url "https://github.com/Kato1052/nls/releases/download/v0.0.10/nls-0.0.10_arm64_linux.tar.gz"
    sha256 "fd667295b456237cc0aa55a47d77b3f873f618be3957f42c7f446b01bc7d4831"
  end

  def install
    bin.install "nls"

    zsh_completion.install "completions/zsh/_nls"
    bash_completion.install "completions/bash/nls"
    fish_completion.install "completions/fish/nls" => "nls.fish"
  end

  test do
    system "#{bin}/nls --help"
  end
end
