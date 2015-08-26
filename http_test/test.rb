# gem install multipart-post
file_path = ARGV[0]
uri = 'http://images.google.com/searchbyimage/upload'

require 'net/http/post/multipart'
url = URI.parse(uri)
body = {
  'encoded_image' => UploadIO.new(File.new(file_path), "image/png", "image.png"),
  "filename" => File.basename(file_path),
  'image_url' => '',
}
req = Net::HTTP::Post::Multipart.new(url.path, body)
res = Net::HTTP.start(url.host, url.port) do |http|
  http.request(req)
end
redirect_url = res["location"]
puts redirect_url
`open #{redirect_url}`

# gem install httpclient
# require 'httpclient'
#
# image = File.open(file_path, 'r')
#
# client = HTTPClient.new
# response = client.post(
#   url,
#   encoded_image: image,
#   filename: File.basename(image),
#   image_url: "",
#   safe: "off",
#   hl: "ja"
# )
# redirect_url = response.headers["Location"]
# response2 = client.get(redirect_url)
# puts response2.body
# require "pry"
# binding.pry

# File.open(file_path) do |file|
#   body = {
#     'encoded_image' => file,
#     'image_url' => '',
#     'safe' => "off",
#     'hl' => "en",
#     "filename" => File.basename(file_path),
#   }
#   response = client.post(uri, body)
#   redirect_url = response.headers["Location"]
#   response2 = client.get(redirect_url)
#   puts response2.body
# end
