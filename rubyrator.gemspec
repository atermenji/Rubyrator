# -*- encoding: utf-8 -*-
lib_dir = File.expand_path('lib', File.dirname(__FILE__))
$LOAD_PATH.unshift(lib_dir) unless $LOAD_PATH.include?(lib_dir)
require 'rubyrator/version'

Gem::Specification.new do |gem|
  gem.name          = "rubyrator"
  gem.version       = Rubyrator::VERSION
  gem.authors       = ["Artur Termenji"]
  gem.email         = ["atermenji@gmail.com"]
  gem.summary       = %q{Python like method decorators for Ruby}
  gem.description   = %q{Python like method decorators for Ruby}
  gem.homepage      = "http://github.com/atermenji/rubyrator"
  gem.licenses      = ["MIT"]

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
  gem.platform      = Gem::Platform::RUBY

  gem.add_development_dependency "rake"
  gem.add_development_dependency "rspec"
end