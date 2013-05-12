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
Xcode is inconsistent about the placement of braces for code that it inserts for
us. Sometimes it puts the opening braces on the same line, sometimes it puts it
on the next line. I prefer it to be on the opening line. This command line app
makes it easy to change selected source files, or all the files in a folder, or
even run with the dry-run option to see what files would be changed.
DESC
  gem.summary       = <<SUMM
A command line app that puts the opening brace for an Objective-C code block on
the same line as the opening clause.
SUMM
  gem.homepage      = "http://abizern.org/fixbraces/"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency "trollop" , "~> 2.0"
  gem.add_development_dependency "rspec", "~> 2.12"
  gem.add_development_dependency "cucumber", "~> 1.2"
  gem.add_development_dependency "aruba", "~> 0.5"
  gem.add_development_dependency "rake"
end
