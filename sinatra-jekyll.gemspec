# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sinatra/jekyll/version'

Gem::Specification.new do |spec|
  spec.name          = 'sinatra-jekyll'
  spec.version       = Sinatra::JekyllExtension::VERSION
  spec.authors       = ['Chris Mytton']
  spec.email         = ['chrismytton@gmail.com']

  spec.summary       = 'Use Jekyll layouts from Sinatra.'
  spec.homepage      = 'https://github.com/theyworkforyou/sinatra-jekyll'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'sinatra', '>= 1', '< 2'
  spec.add_runtime_dependency 'jekyll', '>= 3', '< 4'

  spec.add_development_dependency 'bundler', '~> 1.11'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'minitest', '~> 5.0'
  spec.add_development_dependency 'pry', '~> 0.10'
  spec.add_development_dependency 'rack-test', '~> 0.6'
end
