# coding: UTF-8

require "yaml"
class Setting
   FILE_NAME = "setting.yml"
   FILE_PATH = File.expand_path("../../../resources/#{FILE_NAME}", __FILE__)

   attr_reader :account, :proxy

   def initialize
      yml = YAML.load_file(FILE_PATH)

      @account = yml["account"]
      @proxy = yml["proxy"]
   end
end
