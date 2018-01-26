# -*- encoding: utf-8 -*-
# stub: skylight 1.5.0 ruby lib
# stub: ext/extconf.rb

Gem::Specification.new do |s|
  s.name = "skylight".freeze
  s.version = "1.5.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Tilde, Inc.".freeze]
  s.date = "2017-12-06"
  s.email = ["engineering@tilde.io".freeze]
  s.executables = ["skylight".freeze]
  s.extensions = ["ext/extconf.rb".freeze]
  s.files = ["bin/skylight".freeze, "ext/extconf.rb".freeze]
  s.homepage = "http://www.skylight.io".freeze
  s.licenses = ["Nonstandard".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 1.9.2".freeze)
  s.rubygems_version = "2.5.2".freeze
  s.summary = "Skylight is a smart profiler for Rails apps".freeze

  s.installed_by_version = "2.5.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<activesupport>.freeze, [">= 3.0.0"])
    else
      s.add_dependency(%q<activesupport>.freeze, [">= 3.0.0"])
    end
  else
    s.add_dependency(%q<activesupport>.freeze, [">= 3.0.0"])
  end
end
