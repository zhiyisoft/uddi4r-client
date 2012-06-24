require 'patron'

module UDDI4R
  class RestfulProxy
    def self.execute options, script, args
      session = Patron::Session.new
      session.timeout = 10
      session.base_url = options['url']
      resp = session.get("")
      resp.body
    end
  end
end
