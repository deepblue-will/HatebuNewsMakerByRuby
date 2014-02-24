# encoding: utf-8

# coding: UTF-8

require "yaml"
class Template
   FILE_NAME = "template.yml"
   FILE_PATH = File.expand_path("../../../resources/#{FILE_NAME}", __FILE__)

   attr_reader :outer_start, :outer_end, :inner

   def initialize(format)
      yml = YAML.load_file(FILE_PATH)

      format = yml["format#{format.to_s}"]

      if format.nil?
         raise StandardError.new("テンプレートファイルに指定のフォーマットが定義されてません。")
      end

      @outer_start = format["outer_start"]
      @outer_end = format["outer_end"]
      @inner = format["inner"]
   end
end
