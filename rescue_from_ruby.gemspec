# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rescue_from_ruby/version'

Gem::Specification.new do |spec|
  spec.name          = "rescue_from_ruby"
  spec.version       = RescueFromRuby::VERSION
  spec.authors       = ["Hrvoje Šimić"]
  spec.email         = ["shime.ferovac@gmail.com"]
  spec.description   = %q{ActiveSupport::Rescuable for plain old Ruby objects}
  spec.summary       = %q{Make controller-only ActiveSupport's rescue_from available on every Ruby object.}
  spec.homepage      = "https://github.com/shime/rescue_from_ruby"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
