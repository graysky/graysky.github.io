use Rack::Static, 
  :urls => ["/images", "/javascripts", "/css"],
  :root => "site"

run lambda { |env|
  [
    200, 
    {
      'Content-Type'  => 'text/html', 
      'Cache-Control' => 'public, max-age=86400' 
    },
    File.open('index.html', File::RDONLY)
  ]
}