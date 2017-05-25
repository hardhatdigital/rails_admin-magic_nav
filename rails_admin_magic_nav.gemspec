$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "rails_admin_magic_nav/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "rails_admin_magic_nav"
  s.version     = RailsAdminMagicNav::VERSION
  s.authors     = ["Erik"]
  s.email       = ["erik@hhd.com.au"]
  s.summary     = "Summary of RailsAdminMagicNav."
  s.description = "Description of RailsAdminMagicNav."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", ">= 4.0"
  s.add_runtime_dependency 'rails_admin', '~> 1.1.1'
end
