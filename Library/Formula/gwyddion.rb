require 'formula'

class Gwyddion < Formula
  homepage 'http://gwyddion.net/'
  url 'http://gwyddion.net/download/2.39/gwyddion-2.39.tar.gz'
  sha1 '05ae35544b2f68939f6474fc8edb1f0395d10427'

  depends_on :x11 => :optional
  depends_on 'pkg-config' => :build
  depends_on 'gtk+'
  depends_on 'libxml2'
  depends_on 'fftw'
  depends_on 'gtkglext'
  depends_on :python => :optional
  depends_on 'pygtk' if build.with? 'python'
  depends_on 'gtksourceview' if build.with? 'python'

  def install
    system "./configure", "--disable-dependency-tracking",
                          "--disable-desktop-file-update",
                          "--prefix=#{prefix}",
                          "--with-html-dir=#{doc}"
    system "make install"
  end
end
