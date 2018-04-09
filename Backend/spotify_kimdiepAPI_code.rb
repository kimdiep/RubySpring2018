require 'sinatra'
require 'net/http'
require 'uri'
require 'json'

#http://localhost:4567/

# Demo configuration using user:kim_diep access_token
#Ruby net/http to access specific API based on access token
#Personalised Spotify API - user's top artists
#Personalised Spotify API - user's top tracks
#https://jhawthorn.github.io/curl-to-ruby/
#https://developer.spotify.com/web-api/get-users-top-artists-and-tracks/
#https://beta.developer.spotify.com/console/get-current-user-top-artists-and-tracks/?type=artists&time_range=long_term&limit=10&offset=0
#Returns 10 entries ; index of first entity to return is 0; long_term (calculated from several years of data and including all new data as it becomes available)

uri = URI.parse("https://api.spotify.com/v1/me/top/artists?time_range=long_term&limit=10&offset=0")
request = Net::HTTP::Get.new(uri)
request.content_type = "application/json"
request["Accept"] = "application/json"
request["Authorization"] = "Bearer BQAF5PXu2MjP83DPcTuB091xxt8s48Ea7lYq0pqk-kn7YmMT311z6kQ_SnItLe2Wd3CPQ6tfmVWj89XvULR5VRNGJ6I9rhu2B51DMeuhlDa7ll1L6Yx040Hii_GNkBO99lIAurx4Gc19r0vg"

req_options = {
  use_ssl: uri.scheme == "https",
}

response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
  http.request(request)
end

# Here is the response
# response.code
# response.body
obj = JSON.parse(response.body)
print obj

obj.each do |sub_array| sub_array.each do |name , artist|
    puts "#{name}, #{artist}"
end
end


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
