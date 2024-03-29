$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "uddi4r-client/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "uddi4r-client"
  s.version     = Uddi4rClient::VERSION
  s.authors     = ["suyu"]
  s.email       = ["suyu@zhiyisoft.com"]
  s.homepage    = ""
  s.summary     = "UDDI4R Client."
  s.description = "UDDI4R Client for Prometheus."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["Rakefile"]
  s.test_files = Dir["test/**/*"]

  %w(patron mongo bson_ext json).each {|p| s.add_dependency p}
end
