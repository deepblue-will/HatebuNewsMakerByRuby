# encoding: utf-8

# coding: UTF-8

require 'rspec'
require_relative '../../src/models/template'

describe Template do
   context "正常系" do
      before do
         @target = Template.new(2)
      end
      it "outer_startが取得できること" do
         @target.outer_start.should == '<ul class="news">'
      end
      it "outer_endが取得できること" do
         @target.outer_end.should == "</ul>"
      end
      it "innerが取得できること" do
         @target.inner.should == '<li class="news_item"><a href="%{url}" target="_blank">%{title}</a></li>'
      end
   end
   context "異常系" do
      it "定義されてないフォーマットが指定されると例外が発生すること" do
         lambda {Template.new(3)}.should raise_error(StandardError)
      end
   end
end
