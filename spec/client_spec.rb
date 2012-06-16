require 'spec_helper'

describe "get service define use uddi4r client" do
  it "get a service define" do
    client = UDDI4R::Client.new ("http://localhost:9393/services")
    title = 'com.zhiyisoft.prometheus.configitems.list'

    p client.found(title)
    client.found(title)['title'].should == title
  end
end
