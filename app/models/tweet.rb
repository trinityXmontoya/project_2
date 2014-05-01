require 'rubygems'
require 'oauth'
require 'json'

class Tweet

def self.create_tweet(tweet_content)
# You will need to set your application type to
# read/write on dev.twitter.com and regenerate your access
# token.  Enter the new values here:
consumer_key = OAuth::Consumer.new(
  "yGp6cLPMap06BmBcCvHPMe3h2",
  "PzmJYF2124vPF0rLcjmdI4ycUVvSHfunkMLOUYsCDq1eAThjPQ")
access_token = OAuth::Token.new(
  "2472569468-NWi72830ez9A1tkjgUllJDTiG4G7g3UuIHX1o9n",
  "Cha4JZg0IU3roSDS944VXnMULTlM8YXzl9MyzZV20CnBC")

# Note that the type of request has changed to POST.
# The request parameters have also moved to the body
# of the request instead of being put in the URL.
baseurl = "https://api.twitter.com"
path    = "/1.1/statuses/update.json"
address = URI("#{baseurl}#{path}")
request = Net::HTTP::Post.new address.request_uri
request.set_form_data(
  "status" => tweet_content,
)

# Set up HTTP.
http            = Net::HTTP.new address.host, address.port
http.use_ssl    = true
http.verify_mode = OpenSSL::SSL::VERIFY_PEER

# Issue the request.
request.oauth! http, consumer_key, access_token
http.start
response = http.request request

# Parse and print the Tweet if the response code was 200
tweet = nil
if response.code == '200' then
  tweet = JSON.parse(response.body)
  return "Successfully sent #{tweet["text"]}"
else
  puts "Could not send the Tweet! "
  return "Code:#{response.code} Body:#{response.body}"
end

end
end
