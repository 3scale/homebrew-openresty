require 'formula'

class Openresty < Formula
  homepage 'http://openresty.org/'

  url 'http://openresty.org/download/ngx_openresty-1.5.11.1.tar.gz'
  sha1 '98c8a9353897a534eef339ff3bd622025d1abbe3'

  depends_on 'pcre'
  depends_on 'postgresql' => :optional

  # openresty options
  option 'without-luajit', "Compile *without* support for the Lua Just-In-Time Compiler"
  option 'with-postgresql', "Compile with support for direct communication with PostgreSQL database servers"
  option 'with-iconv', "Compile with support for converting character encodings"

  option 'with-debug', "Compile with support for debug logging but without proper gdb debugging symbols"

  # nginx options
  option 'with-webdav', "Compile with ngx_http_dav_module"
  option 'without-gunzip', "Compile without ngx_http_gunzip_module"

  skip_clean 'logs'

  def install
    args = ["--prefix=#{prefix}",
      "--with-http_ssl_module",
      "--with-pcre",
      "--with-pcre-jit",
      "--sbin-path=#{bin}/openresty",
      "--conf-path=#{etc}/openresty/nginx.conf",
      "--pid-path=#{var}/run/openresty.pid",
      "--lock-path=#{var}/openresty/nginx.lock"
    ]

    args << "--with-http_dav_module" if build.with? 'webdav'
    args << "--with-http_gunzip_module" unless build.without? 'gunzip'

    # Debugging mode, unfortunately without debugging symbols
    if build.with? 'debug'
      args << '--with-debug'
      args << '--with-dtrace-probes'
      args << '--with-no-pool-patch'

      opoo "Openresty will be built --with-debug option, but without debugging symbols. For debugging symbols you have to compile it by hand."
    end

    # OpenResty options
    args << "--with-lua51" if build.without? 'luajit'

    args << "--with-http_postgres_module" if build.with? 'postgres'
    args << "--with-http_iconv_module" if build.with? 'iconv'

    system "./configure", *args

    system "make"
    system "make install"
  end
end