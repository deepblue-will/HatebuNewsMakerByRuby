# encoding: utf-8

require_relative "models/account"
require_relative "models/template"

require "net/http"
require "uri"

HATEBU_FEED_URL = "http://b.hatena.ne.jp/{account_name}/rss"


uri = URI.parse(HATEBU_FEED_URL.gsub("{account_name}", Account.new.name))

request = Net::HTTP::Get.new(uri.path + "?date=20140224")

response = Net::HTTP.start(uri.host) do |http|
   http.get(uri.path)
end

print response.body
