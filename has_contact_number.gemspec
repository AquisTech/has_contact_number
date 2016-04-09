# coding: utf-8
# frozen_string_literal: true
$LOAD_PATH.push File.expand_path('../lib', __FILE__)
require 'has_contact_number/version'

Gem::Specification.new do |spec|

  spec.name          = 'has_contact_number'
  spec.version       = HasContactNumber::VERSION
  spec.authors       = ['Anand Bait']
  spec.email         = ['anand.bait@gmail.com']

  spec.summary       = 'Phone, mobile, fax numbers with ISD code storage and validation.'
  spec.description   = 'Provides support for validating, storing and retrieving phone, mobile, fax numbers with ISD code.'
  spec.homepage      = 'https://github.com/AquisTech/has_contact_number'
  spec.license       = 'MIT'

  spec.files         = %x(git ls-files -z).split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'iso_country_codes'
  spec.add_dependency 'phony_rails'

  spec.add_development_dependency 'bundler', '~> 1.11'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'

end
