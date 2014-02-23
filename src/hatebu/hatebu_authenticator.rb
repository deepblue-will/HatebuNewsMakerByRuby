# coding: UTF-8

require "net/http"

class HatebuAuthenticator
   def initialize(account, oauth_keys)
      @account = account
      @oauth_keys = oauth_keys
   end
end
