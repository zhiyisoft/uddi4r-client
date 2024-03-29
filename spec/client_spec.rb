# -*- coding: utf-8 -*-
require 'spec_helper'
require 'rspec/expectations'
require 'mocha'

RSpec.configure do |config|
  config.mock_framework = :mocha
end

describe UDDI4R::Client do

  before(:each) do
    @client = UDDI4R::Client.new("None") # "http://localhost:9393/services")
    @title = {
      'com.zhiyisoft.prometheus.monitor.device.memory' => {
        "title" => "com.zhiyisoft.prometheus.monitor.device.memory", 
	"desc" => "设备处理器使用情况", 
	"type" => "PrometheusIce", 
	"input" => {"data_type" => "json"}, 
	"output" => { "data_type" => "json" }, 
	"param" => { 
	  "host" => "www.scsyxx.com.cn", "adapter" => "business", 
	  "port" => "10000", "action" => {"sn" => "network.generic.data", "goal" => "memoryUsage"}}}
    }

    @wrapper = {
        "title" => "com.zhiyisoft.prometheus.util.ice.httpwrapper", 
        "desc" => "Ice Web包装器", 
        "type" => "Restful", 
        "input" => {"data_type" => "json"}, 
        "output" => { "data_type" => "json" }, 
        "param" => { 
          "url" => "http://repos.zhiyisoft.com/icewrapper", 
          "method" => "post"
        }
    }

    @title.each do |k,v|
      @client.stubs(:found).with(k).returns(v)
    end
    @client.stubs(:found).with(@wrapper['title']).returns(@wrapper)
  end

  describe "Get service define use uddi4r client:" do
    it "get a service define" do
      @title.keys.each do |t|
        @client.found(t)['title'].should == t
      end
    end
  end

  describe "Run every service:" do
    it "run someone service" do
      @title.keys.each do |t|
        value = @client.invoke(t)
	p value
        JSON.parse(value).should_not be_empty
      end
    end
  end
end
