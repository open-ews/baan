# frozen_string_literal: true

require_relative "lib/baan/version"

Gem::Specification.new do |spec|
  spec.name = "baan"
  spec.version = Baan::VERSION
  spec.authors = [ "David Wilkie" ]
  spec.email = [ "dwilkie@gmail.com" ]

  spec.summary = "A library containing Geodata for administrative regions in Laos"
  spec.description = "A library containing Geodata for administrative regions in Laos"
  spec.homepage = "https://github.com/open-ews/baan"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.4.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/open-ews/baan"
  spec.metadata["changelog_uri"] = "https://github.com/open-ews/baan/blob/main/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  gemspec = File.basename(__FILE__)
  spec.files = IO.popen(%w[git ls-files -z], chdir: __dir__, err: IO::NULL) do |ls|
    ls.readlines("\x0", chomp: true).reject do |f|
      (f == gemspec) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git .github appveyor Gemfile])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = [ "lib" ]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
