# -*- encoding: utf-8 -*-
# stub: devise-jwt-cookie 0.2.0 ruby lib

Gem::Specification.new do |s|
  s.name = "devise-jwt-cookie".freeze
  s.version = "0.2.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Niels van der Zanden".freeze]
  s.bindir = "exe".freeze
  s.date = "2020-04-01"
  s.description = "Cookie-based JWT authentication for devise with configurable token revocation strategies".freeze
  s.email = ["niels@pharynx.nl".freeze]
  s.homepage = "https://github.com/scarhand/devise-jwt-cookie".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.1.2".freeze
  s.summary = "Cookie-based JWT authentication for devise".freeze

  s.installed_by_version = "3.1.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<devise-jwt>.freeze, ["~> 0.6"])
    s.add_runtime_dependency(%q<dry-auto_inject>.freeze, ["~> 0.6"])
    s.add_runtime_dependency(%q<dry-configurable>.freeze, ["~> 0.9", "< 0.11"])
    s.add_development_dependency(%q<bundler>.freeze, ["> 1"])
    s.add_development_dependency(%q<rake>.freeze, ["~> 12.3"])
    s.add_development_dependency(%q<rspec>.freeze, ["~> 3.8"])
    s.add_development_dependency(%q<pry-byebug>.freeze, ["~> 3.7"])
    s.add_development_dependency(%q<rails>.freeze, ["~> 5.0"])
    s.add_development_dependency(%q<sqlite3>.freeze, ["~> 1.3"])
    s.add_development_dependency(%q<rspec-rails>.freeze, ["~> 3.5"])
    s.add_development_dependency(%q<simplecov>.freeze, ["= 0.17"])
    s.add_development_dependency(%q<codeclimate-test-reporter>.freeze, ["~> 1.0"])
  else
    s.add_dependency(%q<devise-jwt>.freeze, ["~> 0.6"])
    s.add_dependency(%q<dry-auto_inject>.freeze, ["~> 0.6"])
    s.add_dependency(%q<dry-configurable>.freeze, ["~> 0.9", "< 0.11"])
    s.add_dependency(%q<bundler>.freeze, ["> 1"])
    s.add_dependency(%q<rake>.freeze, ["~> 12.3"])
    s.add_dependency(%q<rspec>.freeze, ["~> 3.8"])
    s.add_dependency(%q<pry-byebug>.freeze, ["~> 3.7"])
    s.add_dependency(%q<rails>.freeze, ["~> 5.0"])
    s.add_dependency(%q<sqlite3>.freeze, ["~> 1.3"])
    s.add_dependency(%q<rspec-rails>.freeze, ["~> 3.5"])
    s.add_dependency(%q<simplecov>.freeze, ["= 0.17"])
    s.add_dependency(%q<codeclimate-test-reporter>.freeze, ["~> 1.0"])
  end
end
