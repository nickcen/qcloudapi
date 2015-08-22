# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'qcloudapi/version'

Gem::Specification.new do |spec|
  spec.name          = "qcloudapi"
  spec.version       = Qcloudapi::VERSION
  spec.authors       = ["cenyongh"]
  spec.email         = ["cenyongh@gmail.com"]

  spec.summary       = %q{qcloudapi-sdk-ruby是为了让Ruby开发者能够在自己的代码里更快捷方便的使用腾讯云的API而开发的SDK工具包。}
  spec.description   = %q{qcloudapi-sdk-ruby是为了让Ruby开发者能够在自己的代码里更快捷方便的使用腾讯云的API而开发的SDK工具包。}
  spec.homepage      = "https://github.com/nickcen/qcloudapi-sdk-ruby"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "rest-client", '>= 1.8'

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
end