# encoding: utf-8

require "net/http"
require "uri"
require "rss"
require "time"
require "digest/sha1"
require "base64"

class HatebeAccesser
   HATEBU_ATOM_FEED_URL = "http://b.hatena.ne.jp/atom/feed"
   
   def initialize(account, proxy={})
      @proxy = proxy
      @wsse_header = create_wsse_header(account)
   end
   
   def get_atom_feed(start_date="", end_date="", tag="")
      uri = URI.parse(HATEBU_ATOM_FEED_URL)
      header = {"X-WSSE" => @wsse_header, "Accept" => "application/x.atom+xml, application/xml, text/xml, */*"}
      request = Net::HTTP::Get.new(uri.path, header)
      http_class = 
      if @proxy["host"].nil?
         Net::HTTP
      else
         Net::HTTP.Proxy(@proxy["host"], @proxy["port"], @proxy["user_name"], @proxy["password"])
      end

      response = http_class.start(uri.host){|http| http.request(request)}

      if response.code != "200"
         raise StandardError.new("はてブを取得できませんでした。#{response.body}")
      end

      RSS::Parser.parse(response.body, false)
   end
   
   private
      def create_wsse_header(account)
         nonce = Digest::SHA1.digest("#{Time.now.to_f + rand}")
         created = Time.now.iso8601
         password_digest = Base64.encode64(Digest::SHA1.digest(nonce + created + account["api_key"])).chomp
         
         [
            "UsernameToken Username=\"#{account["user_name"]}\"",
            "PasswordDigest=\"#{password_digest}\"",
            "Nonce=\"#{Base64.encode64(nonce).chomp}\"",
            "Created=\"#{created}\""
         ].join(",")
      end
end
