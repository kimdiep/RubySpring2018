require "sinatra"
require "rspotify"

RSpotify.authenticate("33a53c8aa8a24c52b23c4afc13919083", "1dcb63808a7c453daa6150b28690e136")

get ("/") do
print "hello"
  erb :landingpage, layout: :layout
end 

get ("/about") do
  erb :about, layout: :layout
end

get ("/contact") do
  erb :contact, layout: :layout
end

get ("/event") do
  erb :event, layout: :layout
end

get ("/music") do
artistlist = RSpotify::Artist.search('Arctic', limit:3)
@top_artists = artistlist
@firstartist = artistlist[1]
@firstartist1 = artistlist[2]
@firstartist2 = artistlist[3]

artists = RSpotify::Artist.search('Pitbull')
arctic_monkeys = artists.first
print arctic_monkeys.genres 
@album = arctic_monkeys.genres 

# testing
artist = RSpotify::Artist.find('0TnOYISbd1XYRBk9myaseg')
artist.class #=> RSpotify::Artist
artist_name = artist.name 
@name = artist_name

link_artist = artist.external_urls
@link = link_artist['spotify']

images_artist = artist.images.first['url']
@image = images_artist

album_artist = artist.albums.first
album_name = album_artist.name
@album_name = album_name

tracks_artist = album_artist.tracks
@tracks = tracks_artist
first_track = tracks_artist.first
@first_track_url = first_track.preview_url
@first_track_name = first_track.name

second_track = tracks_artist[2]
@second_track_url = second_track.preview_url
@second_track_name = second_track.name

# code required for music page
@albums_list = RSpotify::Album.new_releases(limit: 10)
@name_text = @albums_list.first.name

erb :music, layout: :layout
end

post ("/search") do
  inputquery = params[:querystring]
  @dropdownquery = params[:query]
  puts inputquery
  puts @dropdownquery
  
  if @dropdownquery === "artist"
    result = RSpotify::Artist.search(inputquery)
    puts result.inspect
    @result_show = result[2].external_urls['spotify']
  elsif @dropdownquery === "album"
    result = RSpotify::Album.search(inputquery) 
    puts result.inspect
    @result_show = result.first.external_urls['spotify']
  elsif @dropdownquery === "track"
    result = RSpotify::Track.search(inputquery)
    puts result.inspect
    @result_show = result.first.external_urls['spotify']
  end  
  "hello world"
  erb :search, layout: :layout
end  