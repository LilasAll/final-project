# -*- encoding: utf-8 -*-
# stub: nyan-cat-formatter 0.12.0 ruby lib

Gem::Specification.new do |s|
  s.name = "nyan-cat-formatter".freeze
  s.version = "0.12.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Matt Sears".freeze]
  s.date = "2017-04-27"
  s.description = "Nyan Cat inspired RSpec formatter!".freeze
  s.email = ["matt@mattsears.com".freeze]
  s.homepage = "https://github.com/mattsears/nyan-cat-formatter".freeze
  s.rubygems_version = "3.0.6".freeze
  s.summary = "Nyan Cat inspired RSpec formatter!".freeze

  s.installed_by_version = "3.0.6" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rspec>.freeze, [">= 2.14.2", ">= 2.99", "< 4"])
      s.add_development_dependency(%q<rake>.freeze, [">= 0"])
    else
      s.add_dependency(%q<rspec>.freeze, [">= 2.14.2", ">= 2.99", "< 4"])
      s.add_dependency(%q<rake>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<rspec>.freeze, [">= 2.14.2", ">= 2.99", "< 4"])
    s.add_dependency(%q<rake>.freeze, [">= 0"])
  end
end
