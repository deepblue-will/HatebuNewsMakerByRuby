# encoding: utf-8

require "net/http"
require "uri"
require "rss"
require "time"
require "digest/sha1"
require "base64"

class HatebeAccesser
   HATEBU_ATOM_FEED_URL = "http://b.hatena.ne.jp/{user_name}/atomfeed"
   
   def initialize(user_name, proxy={})
      @user_name = user_name
      @proxy = proxy
   end
   
   def get_atom_feed_entries(option)
      uri = URI.parse(HATEBU_ATOM_FEED_URL.sub("{user_name}", @user_name))
      http_class = 
      if @proxy["host"].nil?
         Net::HTTP
      else
         Net::HTTP.Proxy(@proxy["host"], @proxy["port"], @proxy["user_name"], @proxy["password"])
      end

      entries = []
      option.to_query_params.each do |param|
         request = Net::HTTP::Get.new(uri.path + param)
         response = http_class.start(uri.host){|http| http.request(request)}

         if response.code != "200"
            raise StandardError.new("はてブを取得できませんでした。#{response.body}")
         end
         entries += RSS::Parser.parse(response.body, false).entries
      end
      entries
   end
end
