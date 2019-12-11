# -*- encoding: utf-8 -*-
# stub: faye 1.2.4 ruby lib

Gem::Specification.new do |s|
  s.name = "faye".freeze
  s.version = "1.2.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["James Coglan".freeze]
  s.date = "2017-01-28"
  s.email = "jcoglan@gmail.com".freeze
  s.extra_rdoc_files = ["README.md".freeze]
  s.files = ["README.md".freeze]
  s.homepage = "https://faye.jcoglan.com".freeze
  s.licenses = ["MIT".freeze]
  s.rdoc_options = ["--main".freeze, "README.md".freeze, "--markup".freeze, "markdown".freeze]
  s.rubygems_version = "3.0.6".freeze
  s.summary = "Simple pub/sub messaging for the web".freeze

  s.installed_by_version = "3.0.6" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<cookiejar>.freeze, [">= 0.3.0"])
      s.add_runtime_dependency(%q<em-http-request>.freeze, [">= 0.3.0"])
      s.add_runtime_dependency(%q<eventmachine>.freeze, [">= 0.12.0"])
      s.add_runtime_dependency(%q<faye-websocket>.freeze, [">= 0.9.1"])
      s.add_runtime_dependency(%q<multi_json>.freeze, [">= 1.0.0"])
      s.add_runtime_dependency(%q<rack>.freeze, [">= 1.0.0"])
      s.add_runtime_dependency(%q<websocket-driver>.freeze, [">= 0.5.1"])
      s.add_development_dependency(%q<compass>.freeze, ["~> 0.11.0"])
      s.add_development_dependency(%q<haml>.freeze, ["~> 3.1.0"])
      s.add_development_dependency(%q<permessage_deflate>.freeze, [">= 0.1.0"])
      s.add_development_dependency(%q<puma>.freeze, [">= 2.0.0"])
      s.add_development_dependency(%q<rack-proxy>.freeze, ["~> 0.4.0"])
      s.add_development_dependency(%q<rack-test>.freeze, [">= 0"])
      s.add_development_dependency(%q<rake>.freeze, [">= 0"])
      s.add_development_dependency(%q<rspec>.freeze, ["~> 2.99.0"])
      s.add_development_dependency(%q<rspec-eventmachine>.freeze, [">= 0.2.0"])
      s.add_development_dependency(%q<RedCloth>.freeze, ["~> 3.0.0"])
      s.add_development_dependency(%q<sinatra>.freeze, [">= 0"])
      s.add_development_dependency(%q<sass>.freeze, ["~> 3.2.0"])
      s.add_development_dependency(%q<staticmatic>.freeze, [">= 0"])
      s.add_development_dependency(%q<rainbows>.freeze, ["~> 4.4.0"])
      s.add_development_dependency(%q<thin>.freeze, [">= 1.2.0"])
      s.add_development_dependency(%q<goliath>.freeze, [">= 0"])
      s.add_development_dependency(%q<passenger>.freeze, [">= 4.0.0"])
    else
      s.add_dependency(%q<cookiejar>.freeze, [">= 0.3.0"])
      s.add_dependency(%q<em-http-request>.freeze, [">= 0.3.0"])
      s.add_dependency(%q<eventmachine>.freeze, [">= 0.12.0"])
      s.add_dependency(%q<faye-websocket>.freeze, [">= 0.9.1"])
      s.add_dependency(%q<multi_json>.freeze, [">= 1.0.0"])
      s.add_dependency(%q<rack>.freeze, [">= 1.0.0"])
      s.add_dependency(%q<websocket-driver>.freeze, [">= 0.5.1"])
      s.add_dependency(%q<compass>.freeze, ["~> 0.11.0"])
      s.add_dependency(%q<haml>.freeze, ["~> 3.1.0"])
      s.add_dependency(%q<permessage_deflate>.freeze, [">= 0.1.0"])
      s.add_dependency(%q<puma>.freeze, [">= 2.0.0"])
      s.add_dependency(%q<rack-proxy>.freeze, ["~> 0.4.0"])
      s.add_dependency(%q<rack-test>.freeze, [">= 0"])
      s.add_dependency(%q<rake>.freeze, [">= 0"])
      s.add_dependency(%q<rspec>.freeze, ["~> 2.99.0"])
      s.add_dependency(%q<rspec-eventmachine>.freeze, [">= 0.2.0"])
      s.add_dependency(%q<RedCloth>.freeze, ["~> 3.0.0"])
      s.add_dependency(%q<sinatra>.freeze, [">= 0"])
      s.add_dependency(%q<sass>.freeze, ["~> 3.2.0"])
      s.add_dependency(%q<staticmatic>.freeze, [">= 0"])
      s.add_dependency(%q<rainbows>.freeze, ["~> 4.4.0"])
      s.add_dependency(%q<thin>.freeze, [">= 1.2.0"])
      s.add_dependency(%q<goliath>.freeze, [">= 0"])
      s.add_dependency(%q<passenger>.freeze, [">= 4.0.0"])
    end
  else
    s.add_dependency(%q<cookiejar>.freeze, [">= 0.3.0"])
    s.add_dependency(%q<em-http-request>.freeze, [">= 0.3.0"])
    s.add_dependency(%q<eventmachine>.freeze, [">= 0.12.0"])
    s.add_dependency(%q<faye-websocket>.freeze, [">= 0.9.1"])
    s.add_dependency(%q<multi_json>.freeze, [">= 1.0.0"])
    s.add_dependency(%q<rack>.freeze, [">= 1.0.0"])
    s.add_dependency(%q<websocket-driver>.freeze, [">= 0.5.1"])
    s.add_dependency(%q<compass>.freeze, ["~> 0.11.0"])
    s.add_dependency(%q<haml>.freeze, ["~> 3.1.0"])
    s.add_dependency(%q<permessage_deflate>.freeze, [">= 0.1.0"])
    s.add_dependency(%q<puma>.freeze, [">= 2.0.0"])
    s.add_dependency(%q<rack-proxy>.freeze, ["~> 0.4.0"])
    s.add_dependency(%q<rack-test>.freeze, [">= 0"])
    s.add_dependency(%q<rake>.freeze, [">= 0"])
    s.add_dependency(%q<rspec>.freeze, ["~> 2.99.0"])
    s.add_dependency(%q<rspec-eventmachine>.freeze, [">= 0.2.0"])
    s.add_dependency(%q<RedCloth>.freeze, ["~> 3.0.0"])
    s.add_dependency(%q<sinatra>.freeze, [">= 0"])
    s.add_dependency(%q<sass>.freeze, ["~> 3.2.0"])
    s.add_dependency(%q<staticmatic>.freeze, [">= 0"])
    s.add_dependency(%q<rainbows>.freeze, ["~> 4.4.0"])
    s.add_dependency(%q<thin>.freeze, [">= 1.2.0"])
    s.add_dependency(%q<goliath>.freeze, [">= 0"])
    s.add_dependency(%q<passenger>.freeze, [">= 4.0.0"])
  end
end
