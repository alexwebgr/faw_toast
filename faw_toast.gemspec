# frozen_string_literal: true

require_relative "lib/faw_toast/version"

Gem::Specification.new do |spec|
  spec.name = "faw_toast"
  spec.version = FawToast::VERSION
  spec.authors = ["alexwebgr"]
  spec.email = ["info@example.com"]

  spec.summary = "A simple, configurable toast notification system for Rails applications"
  spec.description = "FawToast provides an easy way to display flash messages as toast notifications in Rails applications"
  spec.homepage = "https://github.com/alexwebgr/faw_toast"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.0.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = "#{spec.homepage}/blob/main/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  gemspec = File.basename(__FILE__)
  spec.files = IO.popen(%w[git ls-files -z], chdir: __dir__, err: IO::NULL) do |ls|
    ls.readlines("\x0", chomp: true).reject do |f|
      (f == gemspec) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git .github appveyor Gemfile])
    end
  end
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency 'rails', '>= 7.0', '< 9.0'
  spec.add_development_dependency "sassc", "~> 2.4"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
