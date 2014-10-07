# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'opal/firebase/version'

Gem::Specification.new do |spec|
  spec.name          = "opal-firebase"
  spec.version       = Opal::Firebase::VERSION
  spec.authors       = ["Gabriel Rios"]
  spec.email         = ["gabrielfalcaorios@gmail.com"]
  spec.description   = %q{Opal access to Firebase}
  spec.summary       = %q{Opal library for Firebase}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_runtime_dependency 'opal', '~> 0.6.0'
end
