# -*- encoding: utf-8 -*-
# stub: capybara-email 2.5.0 ruby lib

Gem::Specification.new do |s|
  s.name = "capybara-email".freeze
  s.version = "2.5.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Brian Cardarella".freeze]
  s.date = "2016-02-17"
  s.description = "Test your ActionMailer and Mailer messages in Capybara".freeze
  s.email = ["bcardarella@gmail.com".freeze, "brian@dockyard.com".freeze]
  s.homepage = "https://github.com/dockyard/capybara-email".freeze
  s.rubygems_version = "2.5.2".freeze
  s.summary = "Test your ActionMailer and Mailer messages in Capybara".freeze

  s.installed_by_version = "2.5.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<mail>.freeze, [">= 0"])
      s.add_runtime_dependency(%q<capybara>.freeze, ["~> 2.4"])
      s.add_development_dependency(%q<actionmailer>.freeze, ["> 3.0"])
      s.add_development_dependency(%q<bourne>.freeze, [">= 0"])
      s.add_development_dependency(%q<rspec>.freeze, [">= 0"])
      s.add_development_dependency(%q<rake>.freeze, [">= 0"])
    else
      s.add_dependency(%q<mail>.freeze, [">= 0"])
      s.add_dependency(%q<capybara>.freeze, ["~> 2.4"])
      s.add_dependency(%q<actionmailer>.freeze, ["> 3.0"])
      s.add_dependency(%q<bourne>.freeze, [">= 0"])
      s.add_dependency(%q<rspec>.freeze, [">= 0"])
      s.add_dependency(%q<rake>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<mail>.freeze, [">= 0"])
    s.add_dependency(%q<capybara>.freeze, ["~> 2.4"])
    s.add_dependency(%q<actionmailer>.freeze, ["> 3.0"])
    s.add_dependency(%q<bourne>.freeze, [">= 0"])
    s.add_dependency(%q<rspec>.freeze, [">= 0"])
    s.add_dependency(%q<rake>.freeze, [">= 0"])
  end
end
