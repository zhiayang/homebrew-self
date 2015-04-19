class Capri < Formula
  homepage "http://capri.ghostkernel.org"
  url "http://capri.ghostkernel.org/downloads/capri-2.1.1-src.tar.gz"
  version "2.1.1"
  sha256 "3b8139592f82e89beb9e8a592c11f775d50a46dc6745597be9ba783996c8087c"

  def install
    Dir.chdir("capri-cli") do
      system "sh", "build.sh", "all"
      system "sh", "build.sh", "install", "--prefix=#{prefix}"
    end
  end

  test do
    system "wget", "http://capri.ghostkernel.org/downloads/capri-2.1.1-src.tar.gz"
    system "tar", "-xf", "capri-2.1.1-src.tar.gz"

    Dir.chdir("capri-2.1.1-src/capri-cli") do
      system "capri"
    end
  end
end
