# coding: UTF-8

require 'rspec'
require '../../src/models/oauth_keys'

describe OAuthKeys do
   before do
      @target = OAuthKeys.new("../../resources/")
   end
   it "keyが取得できること" do
      @target.key.should == "hoge"
   end
   it "secretが取得できること" do
      @target.secret.should == "hogehoge"
   end
end
