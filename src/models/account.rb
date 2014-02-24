# coding: UTF-8

require "yaml"
class Account
   FILE_NAME = "account.yml"
   FILE_PATH = File.expand_path("../../../resources/#{FILE_NAME}", __FILE__)

   attr_reader :name

   def initialize
      yml = YAML.load_file(FILE_PATH)

      @name = yml["name"]
   end
end
