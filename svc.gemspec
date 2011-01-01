# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "svc/version"

Gem::Specification.new do |s|
  s.name        = "svc"
  s.version     = Svc::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Jamie Murai"]
  s.email       = ["murai.jamie@gmail.com"]
  s.homepage    = "https://github.com/jammur/svc"
  s.description = %q{A ruby command line tool for starting and stopping launchd services}
  s.summary     = s.description
  
  s.add_dependency "thor"
  s.add_dependency "json"
  
  s.rubyforge_project = "svc"
  
  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
