# https://www.sitepoint.com/gui-applications-shoes/

# This app is currently non-functional.

Shoes.setup do 
  gem 'json'
end

require 'json'
require 'open-uri'

Shoes.app do 
  # url = "https://developers.facebook.com/docs/public_feed"
  url = 'http://twitter.com/statuses/public_timeline.json'
  entries = JSON.load(open(url).read)

  stack :width => 1.0 do 
    entries.each do |entry|
      para entry["text"], :border => 5
    end 
  end 
end

