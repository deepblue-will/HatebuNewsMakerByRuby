# encoding: utf-8

require 'rspec'
require_relative '../../src/models/setting'

describe Setting do
   before do
      @target = Setting.new
   end
   it "accountが取得できること" do
      @target.account.should_not be_nil
   end
end
