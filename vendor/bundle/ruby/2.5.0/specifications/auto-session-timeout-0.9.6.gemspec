# -*- encoding: utf-8 -*-
# stub: auto-session-timeout 0.9.6 ruby lib

Gem::Specification.new do |s|
  s.name = "auto-session-timeout".freeze
  s.version = "0.9.6"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Matthew Bass".freeze]
  s.date = "2019-10-15"
  s.description = "Provides automatic session timeout in a Rails application.".freeze
  s.email = ["pelargir@gmail.com".freeze]
  s.homepage = "http://github.com/pelargir/auto-session-timeout".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "2.7.6.2".freeze
  s.summary = "Provides automatic session timeout in a Rails application.".freeze

  s.installed_by_version = "2.7.6.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<bundler>.freeze, ["~> 1.3"])
      s.add_development_dependency(%q<rake>.freeze, ["~> 0"])
      s.add_development_dependency(%q<minitest>.freeze, ["~> 4.2"])
      s.add_development_dependency(%q<actionpack>.freeze, ["~> 3.2"])
    else
      s.add_dependency(%q<bundler>.freeze, ["~> 1.3"])
      s.add_dependency(%q<rake>.freeze, ["~> 0"])
      s.add_dependency(%q<minitest>.freeze, ["~> 4.2"])
      s.add_dependency(%q<actionpack>.freeze, ["~> 3.2"])
    end
  else
    s.add_dependency(%q<bundler>.freeze, ["~> 1.3"])
    s.add_dependency(%q<rake>.freeze, ["~> 0"])
    s.add_dependency(%q<minitest>.freeze, ["~> 4.2"])
    s.add_dependency(%q<actionpack>.freeze, ["~> 3.2"])
  end
end
