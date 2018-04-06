require 'sinatra'
require 'rspotify'
#require 'rspotify/oauth'
#http://localhost:4567/

RSpotify::authenticate("d4775da9d2c84dc697553e7c1daea5b4", "83d858dc487d4989b85bc8749009bb72")
# Now you can access playlists in detail, browse featured content and more

# Now you can access playlists in detail, browse featured content and more
me = RSpotify::User.find('kim_diep')
@id = me.id
print me.following(type: 'artist', limit: 50)
#me.playlists #=> (Playlist array)
#print me.playlists
#me.following
#print me.following


# Get recommendations
#recommendations = RSpotify::Recommendations.generate(seed_genres: ['country'])
#recommendations.tracks
#print recommendations.tracks

#Present in erb
get('/') do
  erb :spotify
end
