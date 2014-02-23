# coding: UTF-8

require "yaml"
class Template
   FILE_NAME = "template.yml"

   attr_reader :outer_start, :outer_end, :inner

   def initialize(resource_path, format)
      yml = YAML.load_file(resource_path + FILE_NAME)

      format = yml["format#{format.to_s}"]

      if format.nil?
         raise StandardError.new("テンプレートファイルに指定のフォーマットが定義されてません。")
      end

      @outer_start = format["outer_start"]
      @outer_end = format["outer_end"]
      @inner = format["inner"]
   end
end
