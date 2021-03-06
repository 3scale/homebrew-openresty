# OpenResty Tap

Tap for Homebrew that adds a formula for [OpenResty](http://openresty.org/).

> OpenResty (aka. ngx_openresty) is a full-fledged web application server by
> bundling the standard Nginx core, lots of 3rd-party Nginx modules, as well
> as most of their external dependencies.
>
> By taking advantage of various well-designed Nginx modules, OpenResty
> effectively turns the nginx server into a powerful web app server, in which
> the web developers can use the Lua programming language to script various
> existing nginx C modules and Lua modules and construct extremely high-performance
> web applications that is capable to handle 10K+ connections.
>
> (from <http://openresty.org/>)

## Install

    $ brew tap apitools/homebrew-openresty
    $ brew install openresty

This tap installs a luarocks version which is compatible with openresty:

    $ brew install apitools/openresty/luarocks


## Optional Arguments

To enable debugging:

    $ brew install openresty --with-debug

For a list of all options available, have a look at:

    $ brew info openresty

To run your OpenResty instance:

    $ sudo nginx

To stop your OpenResty instance:

    $ sudo nginx -s stop

## Contributing

If you want to update or enhance this formular, feel free to send a pull request.

