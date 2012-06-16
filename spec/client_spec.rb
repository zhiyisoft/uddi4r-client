require 'spec_helper'
require 'rspec/expectations'

describe UDDI4R::Client do

  before(:each) do
    @client = UDDI4R::Client.new ("http://localhost:9393/services")
    @title = 'com.zhiyisoft.prometheus.configitems.list'
  end

  describe "get service define use uddi4r client" do
    it "get a service define" do
      @client.found(@title)['title'].should == @title
    end
  end

  describe "run a service" do
    it "run a mongodb search" do
      p "-------------", @client.invoke(@title)
      JSON.parse(@client.invoke(@title)).should_not be_empty
    end
  end
end
