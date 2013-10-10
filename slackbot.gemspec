# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "slackbot"
  spec.version       = "0.0.2"
  spec.authors       = ["ecin"]
  spec.email         = ["ecin@copypastel.com"]
  spec.description   = "Tiny library to send messages to the Slack platform."
  spec.summary       = "The laziest bot around."
  spec.homepage      = "https://github.com/typekit/slackbot"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "json", "~> 1.4"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "minitest", "~> 5.0.8"
  spec.add_development_dependency "webmock", "~> 1.8.7"
end
