require 'Ice'
require 'prometheus/ModuleInteractiveApi'

module UDDI4R
  class PrometheusIceProxy
    def self.execute options, script, args
      ic = Ice::initialize()
      base = ic.stringToProxy("#{options['adapter']}:tcp -h #{options['host']} -p #{options['port']}")
      proxy = Com::Zhiyisoft::Mia::ModuleInteractiveApiPrx.checkedCast(base)
      proxy.textRequest(options['action'].to_json)
    end
  end
end
