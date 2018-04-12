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
    @result_show = result.first.external_urls['spotify']
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

