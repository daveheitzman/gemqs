# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "gemqs/version"

Gem::Specification.new do |s|
  s.name        = "gemqs"
  s.version     = Gemqs::VERSION
  s.authors     = ["Dave Heitzman"]
  s.email       = ["daveheitzman@yahoo.com"]
  s.homepage    = "http://aptifuge.com"
  s.summary     = %q{Command line interface to search rubygems.org}
  s.description = %q{Command line interface to search rubygems.org}

  s.rubyforge_project = "gemqs"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  s.add_development_dependency "mechanize"
  s.add_development_dependency "nokogiri"
  s.add_development_dependency "rainbow"

  s.add_runtime_dependency "mechanize"
  s.add_runtime_dependency "nokogiri"
  s.add_runtime_dependency "rainbow"

  s.add_dependency "mechanize"
  s.add_dependency "nokogiri"
  s.add_dependency "rainbow"

end
