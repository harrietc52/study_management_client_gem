# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'study_management_client/version'

Gem::Specification.new do |spec|
  spec.name          = "study_management_client"
  spec.version       = StudyManagementClient::VERSION
  spec.authors       = ["Harriet Craven"]
  spec.email         = ["hc6@sanger.ac.uk"]

  spec.summary       = %q{Gem to access the study management service API}
  spec.description   = %q{Gem to access the study management service API }
  spec.homepage      = "https://rubygems.org/gems/study_management_client"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.

  # if spec.respond_to?(:metadata)
  #   spec.metadata['allowed_push_host'] = 'http://mygemserver.com'
  # else
  #   raise "RubyGems 2.0 or newer is required to protect against " \
  #     "public gem pushes."
  # end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"

  spec.add_runtime_dependency "faraday", "~> 0.11.0"
  spec.add_runtime_dependency "zipkin-tracer", "~> 0.20.1"

end
