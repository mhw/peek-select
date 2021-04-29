# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'peek-select/version'

Gem::Specification.new do |gem|
  gem.name          = 'peek-select'
  gem.version       = Peek::Select::VERSION
  gem.authors       = ['Mark Wilkinson']
  gem.email         = ['mhw@dangerous-techniques.com']
  gem.description   = %q{Take a peek into any collection in your Rails application. A view for https://github.com/peek/peek.}
  gem.summary       = %q{Take a peek into any collection in your Rails application. A view for https://github.com/peek/peek.}
  gem.homepage      = 'https://github.com/mhw/peek-select'

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ['lib']

  gem.add_dependency 'peek'
end
