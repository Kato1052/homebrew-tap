# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://docs.brew.sh/rubydoc/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Nls < Formula
  desc "ls without month abbreviation."
  homepage "https://github.com/Kato1052/nls"
  version "0.0.9"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Kato1052/nls/releases/download/v0.0.9/nls-0.0.9_arm64_darwin.tar.gz"
    sha256 "17ce4821301967f8974505cd701c86ab9136bb955b5915b2e8285861ac44751d"
  end
  if OS.linux? && Hardware::CPU.arm?
    url "https://github.com/Kato1052/nls/releases/download/v0.0.9/nls-0.0.9_arm64_linux.tar.gz"
    sha256 "0ba4cd0535b726ca7b8028f52b4587f60373925d3f383a13d18afbb2bc9e0002"
  end
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/Kato1052/nls/releases/download/v0.0.9/nls-0.0.9_amd64_darwin.tar.gz"
    sha256 "e2276e91ea2b09a981687afdc6fe0b72acd15b9d22474c31c7156b7de672ff1f"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Kato1052/nls/releases/download/v0.0.9/nls-0.0.9_amd64_linux.tar.gz"
    sha256 "53016fc664b2aae0d45b09fe21ca5ee141fc6efe32b7d059e7a38fef9f5b9eaf"
  end

  def install
    bin.install "nls"

    zsh_completion.install "completions/zsh/_nls"
    bash_completion.install "completions/bash/nls"
    fish_completion.install "completions/fish/nls.fish"
  end

  test do
    system "#{bin}/nls --help"
  end
end
