# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)

require "scassh/version"

Gem::Specification.new do |gem|
  gem.authors       = ["Oliver Grimm"]
  gem.email         = ["olly@pixelpogo.de"]
  gem.description   = %q{TODO: Write a gem description}
  gem.summary       = %q{TODO: Write a gem summary}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "scassh"
  gem.require_paths = ["lib"]
  gem.version       = Scassh::VERSION
end
