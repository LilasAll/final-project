# -*- encoding: utf-8 -*-
# stub: private_pub 1.0.3 ruby lib

Gem::Specification.new do |s|
  s.name = "private_pub".freeze
  s.version = "1.0.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.3.4".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Ryan Bates".freeze]
  s.date = "2012-08-20"
  s.description = "Private pub/sub messaging in Rails through Faye.".freeze
  s.email = "ryan@railscasts.com".freeze
  s.homepage = "http://github.com/ryanb/private_pub".freeze
  s.rubygems_version = "3.0.6".freeze
  s.summary = "Private pub/sub messaging in Rails.".freeze

  s.installed_by_version = "3.0.6" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<faye>.freeze, [">= 0"])
      s.add_development_dependency(%q<rake>.freeze, [">= 0"])
      s.add_development_dependency(%q<rspec>.freeze, ["~> 2.8.0"])
      s.add_development_dependency(%q<jasmine>.freeze, [">= 1.1.1"])
    else
      s.add_dependency(%q<faye>.freeze, [">= 0"])
      s.add_dependency(%q<rake>.freeze, [">= 0"])
      s.add_dependency(%q<rspec>.freeze, ["~> 2.8.0"])
      s.add_dependency(%q<jasmine>.freeze, [">= 1.1.1"])
    end
  else
    s.add_dependency(%q<faye>.freeze, [">= 0"])
    s.add_dependency(%q<rake>.freeze, [">= 0"])
    s.add_dependency(%q<rspec>.freeze, ["~> 2.8.0"])
    s.add_dependency(%q<jasmine>.freeze, [">= 1.1.1"])
  end
end
