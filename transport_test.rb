require 'net/http'
require 'uri'
require 'json'
require 'dotenv'
Dotenv.load '.env'

url = URI.parse(ENV['SERVER_URL'])
data = { key: 'value' }.to_json
headers = { 'Content-Type' => 'application/json' }

http = Net::HTTP.new(url.host, url.port)
request = Net::HTTP::Post.new(url.request_uri, headers)
request.body = data

response = http.request(request)

if response.code == '200'
  puts 'Received HTTP 200 response'
else
  puts "Error: #{response.code}"
end
