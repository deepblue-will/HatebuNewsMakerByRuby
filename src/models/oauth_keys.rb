# coding: UTF-8

require "yaml"
class OAuthKeys
   FILE_NAME = "oauth_keys.yml"

   attr_reader :key, :secret

   def initialize(resource_path)
      yml = YAML.load_file(resource_path + FILE_NAME)

      @key = yml["consumer_key"]
      @secret = yml["consumer_secret"]
   end
end
