$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "invite_me/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "invite_me"
  s.version     = InviteMe::VERSION
  s.authors     = ["Kim Fransman"]
  s.email       = ["kim.fransman@gmail.com"]
  s.homepage    = "http://fransman.se"
  s.summary     = "Collect beta requests, easily"
  s.description = "Mount it, collect beta request, roll out requesters to users, remove gem when you're out of beta."

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 4.0.1"
  s.add_dependency "haml", "~> 4.0.4"
  s.add_dependency "email_validator"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "capybara"
  s.add_development_dependency "launchy"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "shoulda-matchers"
  s.add_development_dependency "factory_girl_rails"
  s.add_development_dependency "database_cleaner"
  s.add_development_dependency "debugger"
end
