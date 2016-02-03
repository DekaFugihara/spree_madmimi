# coding: utf-8
# lib = File.expand_path('../lib', __FILE__)
# $LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
# require 'spree_madmimi/version'

Gem::Specification.new do |spec|
  spec.name          = "spree_madmimi"
  spec.version       = '0.0.1'
  spec.authors       = ["Denise Fugihara"]
  spec.email         = ["contato@denika.com.br"]
  spec.summary       = 'Add gem summary here'
  spec.description   = 'Add (optional) gem description here'
  spec.homepage      = "http://www.retroca.com.br/"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'madmimi', '~> 1.1.2'

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
