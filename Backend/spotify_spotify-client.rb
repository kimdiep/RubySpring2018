require 'sinatra'
require 'spotify-client'
#http://localhost:4567/

# Sample configuration:
config = {
  :access_token => 'BQBCzDuYM7u4eAvF04qtP_yaLj6M_wZ2LtJxJcpAZPOgFhvNGkNy6ksCv-u3ZcMnoC4aRbDph64lso6KQnR51BV6TWC3bwDIgpFzMAH44x-56TTfxLOLmsxtc-QWl4CzNBY9NStC224UdJGSNVPBwANMy2Y',  # initialize the client with an access token to perform authenticated calls
  :raise_errors => true,  # choose between returning false or raising a proper exception when API calls fails

  # Connection properties
  :retries       => 0,    # automatically retry a certain number of times before returning
  :read_timeout  => 10,   # set longer read_timeout, default is 10 seconds
  :write_timeout => 10,   # set longer write_timeout, default is 10 seconds
  :persistent    => false # when true, make multiple requests calls using a single persistent connection. Use +close_connection+ method on the client to manually clean up sockets
}
client = Spotify::Client.new(config)
# or with default options:
client = Spotify::Client.new

print client.user_playlists('kim_diep')
