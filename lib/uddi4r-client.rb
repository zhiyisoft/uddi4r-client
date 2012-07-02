require 'rubygems'
require 'patron'
require 'json'

module UDDI4R
  class Client
    def initialize url
      @session = Patron::Session.new
      @session.timeout = 10
      @session.base_url = url
    end

    def found title
      resp = @session.post("/services/#{title}", {})
      JSON.parse(resp.body)
    end

    def invoke title, *args
      service = found(title)
      type = service['type']

      begin
        require "uddi4r-client/#{type.downcase}_proxy"
        klass = UDDI4R.const_get("#{type}Proxy")
        klass.execute(service['param'], service['script'], args)
      rescue LoadError => ex
        invoke('com.zhiyisoft.prometheus.util.ice.httpwrapper', args)
      end
    end

    def register hash_args
      @session.post("/register", hash_args)
    end
  end
end
