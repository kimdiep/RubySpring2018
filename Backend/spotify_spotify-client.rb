require 'sinatra'
require 'spotify-client'
require 'net/http'
require 'uri'
require 'json'

#http://localhost:4567/

# Demo configuration using user:kim_diep access_token
#config = {
  #:access_token => 'BQB4dFf7r147EZlRahjBxLN9vV3g-fmAgQKSsV9NK1_uCQi4k87tLMIIoIVejebFL9ZbJnQN7oF5vwOYOi8o7DBhTUp5W8XlH-R4tfcITn1eVkjBkD_JOAtUgaAyG4LWEaJx-w6NkBSIC1d2f71V9XjBpYA&',  # initialize the client with an access token to perform authenticated calls
  #:raise_errors => true,  # choose between returning false or raising a proper exception when API calls fails

  # Connection properties
  #:retries       => 0,    # automatically retry a certain number of times before returning
  #:read_timeout  => 10,   # set longer read_timeout, default is 10 seconds
  #:write_timeout => 10,   # set longer write_timeout, default is 10 seconds
  #:persistent    => false # when true, make multiple requests calls using a single persistent connection. Use +close_connection+ method on the client to manually clean up sockets
#}

# Client user check

# Demo configuration using user:kim_diep access_token
#client = Spotify::Client.new(config)

#print client.user_playlists('kim_diep')

#Ruby net/http to access specific API based on access token
#Personalised Spotify API - user's top artists
#Personalised Spotify API - user's top tracks
#https://jhawthorn.github.io/curl-to-ruby/
#https://developer.spotify.com/web-api/get-users-top-artists-and-tracks/
#https://beta.developer.spotify.com/console/get-current-user-top-artists-and-tracks/?type=artists&time_range=medium_term&limit=10&offset=5

uri = URI.parse("https://api.spotify.com/v1/me/top/artists?time_range=medium_term&limit=10&offset=5")
request = Net::HTTP::Get.new(uri)
request.content_type = "application/json"
request["Accept"] = "application/json"
request["Authorization"] = "Bearer BQADCd512KkYW9X-WV4P_A9fdOlm_N7Lxp_8vAErRypivfIabzMABxunw3UYHvzh6mo-e8NxXVp9F7w_hQAxopJsbJ0pAYMPI5Ot8gClW7oxQQmlr74PHMXieD4s64aRD_5MGEYlJe0obGop"

req_options = {
  use_ssl: uri.scheme == "https",
}

response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
  http.request(request)
end

# response.code
# response.body
obj = JSON.parse(response.body)
@name = obj['name']

##############################
#uri = URI.parse("https://api.spotify.com/v1/kim_diep/top/artists")
#request = Net::HTTP::Post.new(uri)
#request.content_type = "application/json"
#request["Authorization"] = "Bearer BQB4dFf7r147EZlRahjBxLN9vV3g-fmAgQKSsV9NK1_uCQi4k87tLMIIoIVejebFL9ZbJnQN7oF5vwOYOi8o7DBhTUp5W8XlH-R4tfcITn1eVkjBkD_JOAtUgaAyG4LWEaJx-w6NkBSIC1d2f71V9XjBpYA&"
#request.body = JSON.dump({
  #{}"type" => "A",
  #{}"name" => "www",
  #{}"data" => "162.10.66.0",
  #{}"priority" => nil,
  #{}"port" => nil,
  #{}"weight" => nil
#})

#req_options = {
  #use_ssl: uri.scheme == "https",
#}

#response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
#http.request(request)
#end

#response.code
#response.body

#####################

#Present in erb
get('/') do
  erb :spotify
end

#uri = URI.parse("http://api.sejmometr.pl/posiedzenia/BZfWZ/projekty")

#http = Net::HTTP.new(uri.host, uri.port)
#request = Net::HTTP::Get.new(uri.request_uri)

#response = http.request(request)

#if response.code == "200"
  #result = JSON.parse(response.body)

  #result.each do |doc|
    #puts doc["id"] #reference properties like this
    #puts doc # this is the result in object form
    #puts ""
    #puts ""
  #end
#else
  #puts "ERROR!!!"
#end
