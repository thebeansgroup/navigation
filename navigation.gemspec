# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'navigation/version'

Gem::Specification.new do |spec|
  spec.name          = "navigation"
  spec.version       = Navigation::VERSION
  spec.authors       = ["luxerama"]
  spec.email         = ["vincent@siebert.im"]

  spec.summary       = %q{Navigation data and presenters}
  spec.description   = %q{Navigation data and presenters}
  spec.homepage      = "https://github.com/thebeansgroup/navigation"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "http://gems.ymaservices.com"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = Dir["{config,lib}/**/*", "LICENSE.txt", "Rakefile", "README.md", "CODE_OF_CONDUCT.md"]
  spec.test_files    = Dir["spec/**/*"]
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "draper", "~> 2.0"

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "pry-rails"
end
