# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://docs.brew.sh/rubydoc/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Nls < Formula
  desc "ls without month abbreviation."
  homepage "https://github.com/Kato1052/nls"
  # url "https://github.com/Kato1052/nls/archive/refs/tags/v0.0.8.tar.gz"
  # version "0.0.8"
  # sha256 "87a89d4029f3f87d11dee838262e59853391c72825290eb0536936c4dcb72eee"
  license "MIT"
  version VERSION

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Kato1052/nls/releases/download/v#{VERSION}/nls-#{VERSION}_arm64_darwin.tar.gz"
    sha256 "c08a4b28413f7b8f757baded90b87b2620acdf4617e18f18f800a6a09b521580"
  end
  if OS.linux? && Hardware::CPU.arm?
    url "https://github.com/Kato1052/nls/releases/download/v#{VERSION}/nls-#{VERSION}_arm64_linux.tar.gz"
    sha256 "a11d0014fe549d113c5e9fe018671511f5be05c1b69f458cc1990eca003659c9"
  end
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/Kato1052/nls/releases/download/v#{VERSION}/nls-#{VERSION}_amd64_darwin.tar.gz"
    sha256 "2414df8d8eb4d2db9cb6f341da5ef1dddff236c335cadfc57d7aa152d83c687b"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Kato1052/nls/releases/download/v#{VERSION}/nls-#{VERSION}_amd64_linux.tar.gz"
    sha256 "f1e4fc9b0721f8a1c9aafe8605ff2aee7e9b550f1cf3fcf4ca95b0e55dc8003c"
  end

  # depends_on "cmake" => :build

  # Additional dependency
  # resource "" do
  #   url ""
  #   sha256 ""
  # end

  def install
    # Remove unrecognized options if they cause configure to fail
    # https://docs.brew.sh/rubydoc/Formula.html#std_configure_args-instance_method
    # system "./configure", "--disable-silent-rules", *std_configure_args
    # system "cmake", "-S", ".", "-B", "build", *std_cmake_args
    bin.install "nls"

    zsh_completion.install "completions/zsh/_nls"
    bash_completion.install "completions/bash/nls"
    fish_completion.install "completions/fish/nls"
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test nls`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system bin/"program", "do", "something"`.
    # system "false"
    system "#{bin}/nls --help"
  end
end
