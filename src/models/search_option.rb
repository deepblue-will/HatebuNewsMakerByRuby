# encoding: utf-8

require "date"

class SearchOption
   def initialize(policy, start_date="", end_date="")
      @policy = policy
      @start_date = start_date || ""
      @end_date =  end_date || ""
   end
   
   def to_query_params
      if @start_date.empty?
         offsets = []
         # 1ページ20件
         @policy["get_pages"].to_i.times{|i| offsets << "?of=#{i * 20}"}
         
         offsets
      else
         during_start_end_dates.map{|date| "?date=" + date}
      end
   end
   
   private 
      def during_start_end_dates
         begin
            start_date = Date.parse(@start_date)
            end_date = @end_date.empty? ? start_date : Date.parse(@end_date)

            max_days = @policy["max_days"]
            days = (end_date - start_date).to_i

            if days + 1 > max_days.to_i
               raise StandardError.new("取得する日数が多すぎます。(最大#{max_days}日間)")
            elsif days < 0
               raise StandardError.new("start_date <= end_dateで指定してください")
            end
            
            dates = []
            start_date.step(end_date){|date| dates << date.strftime("%Y%m%d")}
            
            dates
         rescue ArgumentError => e
            raise StandardError.new("指定した日付が不正です。(#{e.message})")
         end
      end
end
