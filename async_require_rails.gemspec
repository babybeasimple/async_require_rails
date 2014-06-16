# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'async_require_rails/version'

Gem::Specification.new do |spec|
  spec.name          = "async_require_rails"
  spec.version       = AsyncRequireRails::VERSION
  spec.authors       = ["babybeasimple"]
  spec.email         = ["babybeasimple@gmail.com"]
  spec.summary       = %q{TODO: Write a short summary. Required.}
  spec.description   = %q{TODO: Write a longer description. Optional.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "guard-rspec"

  spec.add_dependency "faraday", "~> 0.9"
  spec.add_dependency "connection_pool", "~> 2.0"
  spec.add_dependency "celluloid", "~> 0.15"
  spec.add_dependency "multi_json", "~> 1.10"
end
