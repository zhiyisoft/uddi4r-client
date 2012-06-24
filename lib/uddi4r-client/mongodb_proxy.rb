require 'mongo'

module UDDI4R
  class MongoDBProxy
    def self.execute options, script, args
      db = Mongo::Connection.new.db(options["database"])
      db[options["table"]].find.to_a
    end
  end
end
