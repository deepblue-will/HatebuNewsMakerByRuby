# encoding: utf-8

require "rspec"
require_relative "../../src/models/search_option"

describe SearchOption do
   before do
      @policy = {"max_days" => "5", "get_pages" => "2"}
   end
   context "#to_query_paramsは" do
      context "start_dateを指定しない場合" do
         it "?of=xxの配列が返却されること" do
            option = SearchOption.new(@policy)
            result = option.to_query_params
            result.should == ["?of=0", "?of=20"]
         end
      end
      context "start_dateが指定される場合" do
         it "?date=xxの配列が返却されること" do
            option = SearchOption.new(@policy, "20140401", "20140403")
            option.should_receive(:during_start_end_dates).and_return(["20140401", "20140402"])
            
            result = option.to_query_params
            result.should == ["?date=20140401", "?date=20140402"]
         end
      end
   end
   context "#during_start_end_datesは" do
      it "start_dateからend_dateまでの日付の配列が取得できること" do
         option = SearchOption.new(@policy, "20140401", "20140405")
         result = option.send(:during_start_end_dates)
         
         result.should == ["20140401", "20140402", "20140403", "20140404", "20140405"]
      end
      context "日付として不正な文字列を指定すると" do
         it "エラーになること" do
            option = SearchOption.new(@policy, "aaaa")
            lambda{option.send(:during_start_end_dates)}.should raise_error(StandardError)
         end
      end
      context "取得する日数が最大値を超えていると" do
         it "エラーになること" do
            option = SearchOption.new(@policy, "20140401", "20140406")
            lambda{option.send(:during_start_end_dates)}.should raise_error(StandardError)
         end
      end
      context "start_date > end_dateの場合" do
         it "エラーになること" do
            option = SearchOption.new(@policy, "20140401", "20140331")
            lambda{option.send(:during_start_end_dates)}.should raise_error(StandardError)
         end
      end
   end
end
