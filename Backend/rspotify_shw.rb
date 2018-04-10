require "sinatra"
require "omniauth-spotify"
require "spotify-client"
require "rspotify"
# https://github.com/icoretech/spotify-client
# https://developer.spotify.com/web-api/using-scopes/
# https://github.com/icoretech/omniauth-spotify
# https://github.com/omniauth/omniauth/wiki/Sinatra-Example
# https://github.com/guilhermesad/rspotify

# use Rack::Session::Cookie, key: 'N&wedhSDF',
#   domain: "localhost",
#   path: '/',
#   expire_after: 14400,
#   secret: '*&(^B234'
# use OmniAuth::Builder do
#   provider :spotify, '33a53c8aa8a24c52b23c4afc13919083', '1dcb63808a7c453daa6150b28690e136', scope: 'user-read-private user-read-birthdate user-read-email'
# end

# get '/auth/:provider/callback' do
  
#   config = {
#     :access_token => request.env['omniauth.auth'].credentials.token,  # initialize the client with an access token to perform authenticated calls
#     :raise_errors => true,  # choose between returning false or raising a proper exception when API calls fails

#     # Connection properties
#     :retries       => 0,    # automatically retry a certain number of times before returning
#     :read_timeout  => 10,   # set longer read_timeout, default is 10 seconds
#     :write_timeout => 10,   # set longer write_timeout, default is 10 seconds
#     :persistent    => false # when true, make multiple requests calls using a single persistent connection. Use +close_connection+ method on the client to manually clean up sockets
#   }
#   client = Spotify::Client.new(config)

#   print client.me

#   erb "<h1>#{params[:provider]}</h1>
#   <pre>#{JSON.pretty_generate(request.env['omniauth.auth'])}</pre>"
# end


  
# print "hello \n"
# get ("/") do
#   erb "
#     <a href='http://localhost:4567/auth/spotify'>Login with Spotify</a><br>
#   "
# end


RSpotify.authenticate("33a53c8aa8a24c52b23c4afc13919083", "1dcb63808a7c453daa6150b28690e136")

artists = RSpotify::Artist.search('Arctic Monkeys')

arctic_monkeys = artists.first
print arctic_monkeys.genres 

artist = RSpotify::Artist.find('7Ln80lUS6He07XvHI8qqHH')
artist.class #=> RSpotify::Artist
name = artist.name 
print name



get ("/") do
  erb :spotify
end 