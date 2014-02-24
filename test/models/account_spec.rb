# encoding: utf-8

require 'rspec'
require_relative '../../src/models/account'

describe Account do
   before do
      @target = Account.new
   end
   it "nameが取得できること" do
      @target.name.should == "deepblue_will"
   end
end
