# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)

require "scassh/version"

Gem::Specification.new do |gem|
  gem.authors       = ["Oliver Grimm"]
  gem.email         = ["olly@pixelpogo.de"]
  gem.description   = %q{Scassh is a tiny tool, that utilizes the Scalarium API to gather information, about clouds and their instances, required to start a SSH session on a single AWS EC2 instance.}
  gem.summary       = %q{ssh to your Scalarium instance easily}

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.name          = "scassh"
  gem.homepage      = "https://github.com/pixelpogo/scassh"
  gem.require_paths = ["lib"]
  gem.version       = Scassh::VERSION


  gem.add_runtime_dependency "rest-client"
  gem.add_runtime_dependency "json"
  gem.add_runtime_dependency "highline"

end
