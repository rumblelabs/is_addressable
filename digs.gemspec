# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "digs/version"

Gem::Specification.new do |s|
  s.name        = "digs"
  s.version     = Digs::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Phil McClure"]
  s.email       = ["pmcclure@rumblelabs.com"]
  s.homepage    = "http://rumblelabs.com"
  s.summary     = %q{Adds addressable attributes to a model}
  s.description = %q{Adds addressable attributes to a model}

  s.rubyforge_project = "digs"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end