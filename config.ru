require 'rack'
require 'erb'

use Rack::Static,
  :urls => ["/images", "/js", "/css"],
  :root => "public"

def erb(template)
  path = File.expand_path("#{template}")
  ERB.new(File.read(path)).result(binding)
end

run Proc.new { |env|
  ['200', {'Content-Type' => 'text/html'}, [erb("public/index.html.erb")]]
}