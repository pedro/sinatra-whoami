# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name        = "sinatra-whoami"
  s.version     = "0.0.1"
  s.authors     = ["Pedro Belo"]
  s.email       = ["pedro@heroku.com"]
  s.homepage    = "http://github.com/pedro/sinatra-whoami"
  s.summary     = %q{Sinatra extension to allow routes to know their path}
  s.description = %q{Sinatra extension to allow routes to know their path}

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_runtime_dependency 'sinatra', '~> 1.4.2'
  s.add_development_dependency 'rack-test', '~> 0.6.2'
end
