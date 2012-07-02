require 'patron'

module UDDI4R
  class RestfulProxy
    def self.execute options, script, args
      session = Patron::Session.new
      session.timeout = 10
      session.base_url = options['url']
      if options['method']=='get'
        resp = session.get("")
      else
        resp = session.post("", args)
      end
      resp.body
    end
  end
end
