lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'number_to_yen/version'

Gem::Specification.new do |spec|
  spec.name          = 'number_to_yen'
  spec.version       = NumberToYen::VERSION
  spec.authors       = ['Tsukuru Tanimichi']
  spec.email         = ['info@ttanimichi.com']

  spec.summary       = 'Formats a number into a Japanese Yen string (e.g., 12万3,456円).'
  spec.homepage      = 'https://github.com/ttanimichi/number_to_yen'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.required_ruby_version = '>= 2.2.0'

  spec.add_development_dependency 'bundler', '~> 1.14'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'minitest', '~> 5.0'
  spec.add_development_dependency 'minitest-power_assert'
end
