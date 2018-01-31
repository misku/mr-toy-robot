lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mrrobot/version'

Gem::Specification.new do |spec|
  spec.name          = 'mrrobot'
  spec.version       = Mrrobot::VERSION
  spec.authors       = ['mr_robot']
  spec.email         = ['mr_robot@mr_robot.com']

  spec.summary       = 'Toy robot simulator.'
  spec.description   = 'The application is a simulation of a toy robot moving' \
    ' on a square tabletop.'
  spec.license       = 'MIT'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the
  # 'allowed_push_host' to allow pushing to a single host or delete this section
  #  to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise 'RubyGems 2.0 or newer is required to protect against public gem' \
      ' pushes.'
  end

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'bin'
  spec.executables   = ['mrrobot']
  spec.require_paths = ['lib']

  # Runtime dependencies
  spec.add_runtime_dependency 'logging', '~> 2.2'
  # Development dependencies
  spec.add_development_dependency 'bundler', '~> 1.16'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rubocop', '~> 0.52'
  spec.add_development_dependency 'simplecov', '~> 0.15'
end
