class OptionInputer
   
   attr_reader :start_date, :end_date, :format
   
   def initialize()
      input_option
   end
   
   private
      def input_option
         puts "start_date? (yyyymmdd)"
         @start_date = gets.chomp
         
         unless start_date.empty?
            puts "end_date?"
            @end_date = gets.chomp
         end
         
         puts "format_number?(1, 2...)(see \"template.yml\")"
         @format = gets.chomp
         
         puts "Please wait..."
      end
end
