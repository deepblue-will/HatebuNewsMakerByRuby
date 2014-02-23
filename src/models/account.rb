# coding: UTF-8

require "yaml"
class Account
   FILE_NAME = "account.yml"

   attr_reader :id, :password

   def initialize(resource_path)
      yml = YAML.load_file(resource_path + FILE_NAME)

      @id = yml["id"]
      @password = yml["password"]
   end
end
