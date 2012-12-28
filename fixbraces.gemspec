# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'fixbraces/version'

Gem::Specification.new do |gem|
  gem.name          = "fixbraces"
  gem.version       = Fixbraces::VERSION
  gem.authors       = ["Abizer Nasir"]
  gem.email         = ["abizern@junglecandy.com"]
  gem.description   = <<DESC
I prefer my opening braces to be on the same line as the opening clause.
Xcode, and people I collaborate with are inconsistent about the placement
of the opening brace. This corrects it for a file or a directory.
DESC
  gem.summary       = "Puts the opening brace on the same line"
  gem.homepage      = "https://github.com/abizern/fixbraces"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
