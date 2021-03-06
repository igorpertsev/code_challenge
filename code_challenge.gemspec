lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "code_challenge/version"

Gem::Specification.new do |spec|
  spec.name          = "code_challenge"
  spec.version       = CodeChallenge::VERSION
  spec.authors       = ["Igor Pertsav"]
  spec.email         = ["igor.y.pertsav@gmail.com"]

  spec.summary       = %q{Easy to use API for Code Challenge}
  spec.description   = %q{Providing easy access to use Coding Challenge API from ruby application}
  spec.homepage      = "https://github.com/igorpertsev/code_challenge"
  spec.license       = "MIT"

  spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/igorpertsev/code_challenge"
  spec.metadata["changelog_uri"] = "https://github.com/igorpertsev/code_challenge/commits/master"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rspec", "~> 3.9"
  spec.add_development_dependency "rest-client", "~> 2.1"
end
