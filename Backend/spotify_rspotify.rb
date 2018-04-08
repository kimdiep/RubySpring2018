require 'sinatra'
require 'rspotify'
#http://localhost:4567/

#Demo Purposes: Provide client_id and client_secret for Spotify user kim_diep
RSpotify::authenticate("", "")

# Access user RSpotify::Playlist for specific playlist information
#user = RSpotify::User.find('kim_diep')
#userPlaylists = user.playlists #=> (Playlist array)
#print userPlaylists

#Present in erb
get('/') do
  erb :spotify
end
