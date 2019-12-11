# -*- encoding: utf-8 -*-
# stub: bootstrap-slider-rails 9.8.0 ruby lib

Gem::Specification.new do |s|
  s.name = "bootstrap-slider-rails".freeze
  s.version = "9.8.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Pedr Browne".freeze]
  s.date = "2017-06-30"
  s.description = "Make Bootstrap Slider available to Rails".freeze
  s.email = ["pedr.browne@gmail.com".freeze]
  s.homepage = "https://github.com/YourCursus/bootstrap-slider-rails".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.0.6".freeze
  s.summary = "This Gem integrates Seiyara's fork of Bootstrap Slider with Rails, exposing its JavaScript and CSS assets via a Rails Engine.".freeze

  s.installed_by_version = "3.0.6" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<railties>.freeze, [">= 3.2", "< 6.0"])
      s.add_development_dependency(%q<bundler>.freeze, ["~> 1.3"])
      s.add_development_dependency(%q<rake>.freeze, [">= 0"])
    else
      s.add_dependency(%q<railties>.freeze, [">= 3.2", "< 6.0"])
      s.add_dependency(%q<bundler>.freeze, ["~> 1.3"])
      s.add_dependency(%q<rake>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<railties>.freeze, [">= 3.2", "< 6.0"])
    s.add_dependency(%q<bundler>.freeze, ["~> 1.3"])
    s.add_dependency(%q<rake>.freeze, [">= 0"])
  end
end
