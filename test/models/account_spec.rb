# coding: UTF-8

require 'rspec'
require '../../src/models/account'

describe Account do
   before do
      @target = Account.new("../../resources/")
   end
   it "idが取得できること" do
      @target.id.should == "hoge"
   end
   it "passwordが取得できること" do
      @target.password.should == "hogehoge"
   end
end
