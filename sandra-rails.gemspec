# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "sandra-rails/version"

Gem::Specification.new do |s|
  s.name        = "sandra-rails"
  s.version     = Sandra::Rails::VERSION
  s.authors     = ["Charles Max Wood"]
  s.email       = ["chuck@teachmetocode.com"]
  s.homepage    = ""
  s.summary     = %q{Connect Sandra with Rails}
  s.description = %q{Connect Sandra with Rails}

  s.rubyforge_project = "sandra-rails"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  s.add_runtime_dependency "sandra"
  s.add_runtime_dependency "actionpack", ["~> 3.2.0"]
  s.add_runtime_dependency "railties", ["~> 3.2.0"]
  # s.add_runtime_dependency "rest-client"
end
