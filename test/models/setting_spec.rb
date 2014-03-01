# encoding: utf-8

require 'rspec'
require_relative '../../src/models/setting'

describe Setting do
   before do
      @target = Setting.new
   end
   it "accountが取得できること" do
      account = @target.account
      account["user_name"].should == "deepblue_will"
   end
   it "proxyが取得できること" do
      proxy = @target.proxy
      proxy.should_not be_nil
   end
   it "policyが取得できること" do
      policy = @target.policy
      policy["max_days"].should == 14
      policy["max_feed_no_option"] == 1
   end
end
