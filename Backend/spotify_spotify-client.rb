require 'sinatra'
require 'spotify-client'
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

#####################

#Present in erb
get('/') do
  erb :spotify
end
