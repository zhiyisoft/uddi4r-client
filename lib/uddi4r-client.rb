require 'rubygems'
require 'patron'
require 'json'
require 'client/mongodb'

module UDDI4R
  class Client
    def initialize url
      @session = Patron::Session.new
      @session.timeout = 10
      @session.base_url = url
    end

    def found title
      resp = @session.post("/#{title}", {})
      JSON.parse(resp.body)
    end

    def invoke title, *args
      service = found(title)
      if service['type'] == 'MongoDB' then
        resp = UDDI4R::Client::MongoDB.execute(service['param'], service['script'], args)
        resp.to_json
      end
    end
  end
end
