# -*- encoding: utf-8 -*-
# stub: beaker 2.24.0 ruby lib

Gem::Specification.new do |s|
  s.name = "beaker"
  s.version = "2.24.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Puppetlabs"]
  s.date = "2015-09-15"
  s.description = "Puppetlabs accceptance testing harness"
  s.email = ["delivery@puppetlabs.com"]
  s.executables = ["beaker"]
  s.files = ["bin/beaker"]
  s.homepage = "https://github.com/puppetlabs/beaker"
  s.licenses = ["Apache2"]
  s.rubygems_version = "2.2.2"
  s.summary = "Let's test Puppet!"

  s.installed_by_version = "2.2.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rspec>, ["~> 3.0"])
      s.add_development_dependency(%q<rspec-its>, [">= 0"])
      s.add_development_dependency(%q<fakefs>, ["~> 0.6"])
      s.add_development_dependency(%q<rake>, ["~> 10.1"])
      s.add_development_dependency(%q<simplecov>, [">= 0"])
      s.add_development_dependency(%q<pry>, ["~> 0.10"])
      s.add_development_dependency(%q<yard>, [">= 0"])
      s.add_development_dependency(%q<markdown>, [">= 0"])
      s.add_development_dependency(%q<thin>, [">= 0"])
      s.add_runtime_dependency(%q<minitest>, ["~> 5.4"])
      s.add_runtime_dependency(%q<json>, ["~> 1.8"])
      s.add_runtime_dependency(%q<hocon>, ["~> 0.1"])
      s.add_runtime_dependency(%q<net-ssh>, ["~> 2.9"])
      s.add_runtime_dependency(%q<net-scp>, ["~> 1.2"])
      s.add_runtime_dependency(%q<inifile>, ["~> 2.0"])
      s.add_runtime_dependency(%q<rsync>, ["~> 1.0.9"])
      s.add_runtime_dependency(%q<open_uri_redirections>, ["~> 0.2.1"])
      s.add_runtime_dependency(%q<beaker-answers>, ["~> 0.0"])
      s.add_runtime_dependency(%q<stringify-hash>, ["~> 0.0"])
      s.add_runtime_dependency(%q<rbvmomi>, ["~> 1.8"])
      s.add_runtime_dependency(%q<fission>, ["~> 0.4"])
      s.add_runtime_dependency(%q<google-api-client>, ["~> 0.8"])
      s.add_runtime_dependency(%q<aws-sdk>, ["~> 1.57"])
      s.add_runtime_dependency(%q<docker-api>, [">= 0"])
      s.add_runtime_dependency(%q<fog>, ["~> 1.25"])
      s.add_runtime_dependency(%q<unf>, ["~> 0.1"])
    else
      s.add_dependency(%q<rspec>, ["~> 3.0"])
      s.add_dependency(%q<rspec-its>, [">= 0"])
      s.add_dependency(%q<fakefs>, ["~> 0.6"])
      s.add_dependency(%q<rake>, ["~> 10.1"])
      s.add_dependency(%q<simplecov>, [">= 0"])
      s.add_dependency(%q<pry>, ["~> 0.10"])
      s.add_dependency(%q<yard>, [">= 0"])
      s.add_dependency(%q<markdown>, [">= 0"])
      s.add_dependency(%q<thin>, [">= 0"])
      s.add_dependency(%q<minitest>, ["~> 5.4"])
      s.add_dependency(%q<json>, ["~> 1.8"])
      s.add_dependency(%q<hocon>, ["~> 0.1"])
      s.add_dependency(%q<net-ssh>, ["~> 2.9"])
      s.add_dependency(%q<net-scp>, ["~> 1.2"])
      s.add_dependency(%q<inifile>, ["~> 2.0"])
      s.add_dependency(%q<rsync>, ["~> 1.0.9"])
      s.add_dependency(%q<open_uri_redirections>, ["~> 0.2.1"])
      s.add_dependency(%q<beaker-answers>, ["~> 0.0"])
      s.add_dependency(%q<stringify-hash>, ["~> 0.0"])
      s.add_dependency(%q<rbvmomi>, ["~> 1.8"])
      s.add_dependency(%q<fission>, ["~> 0.4"])
      s.add_dependency(%q<google-api-client>, ["~> 0.8"])
      s.add_dependency(%q<aws-sdk>, ["~> 1.57"])
      s.add_dependency(%q<docker-api>, [">= 0"])
      s.add_dependency(%q<fog>, ["~> 1.25"])
      s.add_dependency(%q<unf>, ["~> 0.1"])
    end
  else
    s.add_dependency(%q<rspec>, ["~> 3.0"])
    s.add_dependency(%q<rspec-its>, [">= 0"])
    s.add_dependency(%q<fakefs>, ["~> 0.6"])
    s.add_dependency(%q<rake>, ["~> 10.1"])
    s.add_dependency(%q<simplecov>, [">= 0"])
    s.add_dependency(%q<pry>, ["~> 0.10"])
    s.add_dependency(%q<yard>, [">= 0"])
    s.add_dependency(%q<markdown>, [">= 0"])
    s.add_dependency(%q<thin>, [">= 0"])
    s.add_dependency(%q<minitest>, ["~> 5.4"])
    s.add_dependency(%q<json>, ["~> 1.8"])
    s.add_dependency(%q<hocon>, ["~> 0.1"])
    s.add_dependency(%q<net-ssh>, ["~> 2.9"])
    s.add_dependency(%q<net-scp>, ["~> 1.2"])
    s.add_dependency(%q<inifile>, ["~> 2.0"])
    s.add_dependency(%q<rsync>, ["~> 1.0.9"])
    s.add_dependency(%q<open_uri_redirections>, ["~> 0.2.1"])
    s.add_dependency(%q<beaker-answers>, ["~> 0.0"])
    s.add_dependency(%q<stringify-hash>, ["~> 0.0"])
    s.add_dependency(%q<rbvmomi>, ["~> 1.8"])
    s.add_dependency(%q<fission>, ["~> 0.4"])
    s.add_dependency(%q<google-api-client>, ["~> 0.8"])
    s.add_dependency(%q<aws-sdk>, ["~> 1.57"])
    s.add_dependency(%q<docker-api>, [">= 0"])
    s.add_dependency(%q<fog>, ["~> 1.25"])
    s.add_dependency(%q<unf>, ["~> 0.1"])
  end
end
