# encoding: utf-8

# coding: UTF-8

require "yaml"
class Template
   FILE_NAME = "template.yml"
   FILE_PATH = File.expand_path("../../../resources/#{FILE_NAME}", __FILE__)
   
   # テンプレート中の置換文字
   URL_VAR = "%{url}"
   TITLE_VAR = "%{title}"
   COMMENT_VAR = "%{comment}"


   attr_reader :outer_start, :outer_end, :inner

   def initialize(format_num)
      yml = YAML.load_file(FILE_PATH)

      format = yml["format#{format_num.to_s}"]

      if format.nil?
         raise StandardError.new("テンプレートファイルに指定のフォーマットが定義されてません。")
      end

      @outer_start = format["outer_start"]
      @outer_end = format["outer_end"]
      @inner = format["inner"]
   end
   
   def get_tags(entries)
      raise StandardError.new("はてブがありませんでした。") if entries.size == 0
      
      tags = [@outer_start]
      entries.each{|entry| tags << replace_template(entry)}
      tags << @outer_end
      
      tags.join("\n")
   end
   
   private 
      def replace_template(entry)
         result = @inner.gsub(URL_VAR, entry.link.href)
         result = result.gsub(TITLE_VAR, entry.title.content)
         result = result.gsub(COMMENT_VAR, entry.summary.content)

         result
      end
end
