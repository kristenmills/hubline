# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'hubline/version'

Gem::Specification.new do |spec|
  spec.name          = "hubline"
  spec.version       = Hubline::VERSION
  spec.authors       = ["Kristen Mills"]
  spec.email         = ["kristen@kristen-mills.com"]
  spec.summary       = "A github client for your terminal."
  spec.homepage      = "https://github.com/kristenmills/hubline"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "highline"
  spec.add_dependency "octokit"
  spec.add_dependency "activesupport"

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "yard"
end
