require 'formula'

class Luarocks < Formula

  homepage 'https://luarocks.org'

  stable do
    url 'https://github.com/luarocks/luarocks/archive/v2.4.3.tar.gz'
    sha256 'ea1881d6954f2a98c34f93674571c8f0cbdbc28dedb3fa3cb56b6a91886d1a99'
  end

  depends_on "openresty/brew/openresty"

  def install
    openresty_folder                 = Formula["openresty/brew/openresty"].opt_prefix
    openresty_luajit_folder          = File.join(openresty_folder, 'luajit')
    openresty_luajit_include_folder  = File.join(openresty_luajit_folder, 'include', 'luajit-2.1')

    system "./configure",
           "--prefix=#{prefix}",
           "--rocks-tree=#{HOMEBREW_PREFIX}",
           "--with-lua=#{openresty_luajit_folder}",
           "--with-lua-include=#{openresty_luajit_include_folder}",
           "--lua-version=5.1",
           "--lua-suffix=jit"

    system "make", "build"
    system "make", "install"
  end

end
