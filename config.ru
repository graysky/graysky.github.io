require 'bundler'
Bundler.setup
Bundler.require
require 'rack/contrib/try_static'

use Rack::TryStatic, 
    :root => "site",  # static files root dir
    :urls => %w[/],     # match all requests 
    :try => ['.html', 'index.html', '/index.html'] # try these postfixes sequentially
run lambda { [404, {'Content-Type' => 'text/html'}, ['Not Found']]}


# # use Rack::Static, 
# #   :urls => ["/images", "/javascript", "/css"],
# #   :root => "site"

# # run lambda { |env|
# #   puts env.class
# #   puts env["REQUEST_PATH"]

# #   path = env["REQUEST_PATH"]

# #   file = "404"
# #   if path == "/"
# #     file = 'site/index.html'
# #   elsif
# #     # Remove leading "/"
# #     fpath = path.slice(1..-1) 

# #     if File.exist?(fpath) and File.file?(fpath)
# #       file = fpath
# #     else
# #       file = fpath + "/index.html"
# #     end
# #   end
# #   puts file
# #   [
# #     200, 
# #     {
# #       'Content-Type'  => 'text/html', 
# #       'Cache-Control' => 'public, max-age=86400' 
# #     },
# #     File.open(file, File::RDONLY)
# #   ]
# # }

# module Rack

#   class TryStatic

#     def initialize(app, options)
#       @app = app
#       @try = ['', *options.delete(:try)]
#       @static = ::Rack::Static.new(lambda { [404, {}, []] }, options)
#     end

#     def call(env)
#       orig_path = env['PATH_INFO']
#       found = nil
#       @try.each do |path|
#         resp = @static.call(env.merge!({'PATH_INFO' => orig_path + path}))
#         break if 404 != resp[0] && found = resp
#       end
#       found or @app.call(env.merge!('PATH_INFO' => orig_path))
#     end
#   end
# end

# use Rack::TryStatic, :root => "site", :urls => %w[/], :try => ['.html', 'index.html', '/index.html']

# # Run your own Rack app here or use this one to serve 404 messages:
# run lambda{ |env| [
#      200, 
#      {
#        'Content-Type'  => 'text/html', 
#        'Cache-Control' => 'public, max-age=86400' 
#      },
#      File.open('index.html', File::RDONLY)
#    ] }