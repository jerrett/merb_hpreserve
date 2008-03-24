require 'rubygems'
require 'rake/gempackagetask'

PLUGIN = "merb-hpreserve"
NAME = "merb-hpreserve"
VERSION = "0.9.1"
AUTHOR = "Jerrett Taylor"
EMAIL = "jerrett@gmail.com"
HOMEPAGE = "http://github.com/jerrett/merb_hpreserve"
SUMMARY = "Merb plugin that provides Hpreserve support"

spec = Gem::Specification.new do |s|
  s.name = NAME
  s.version = VERSION
  s.platform = Gem::Platform::RUBY
  s.has_rdoc = true
  s.extra_rdoc_files = ["README", "LICENSE"]
  s.summary = SUMMARY
  s.description = s.summary
  s.author = AUTHOR
  s.email = EMAIL
  s.homepage = HOMEPAGE
  s.add_dependency('merb-core', '>= 0.9.1')
  s.require_path = 'lib'
  s.autorequire = PLUGIN
  s.files = %w(LICENSE README Rakefile) + Dir.glob("{lib,specs}/**/*")
end

Rake::GemPackageTask.new(spec) do |pkg|
  pkg.gem_spec = spec
end

task :install => [:package] do
  sh %{sudo gem install pkg/#{NAME}-#{VERSION}}
end

namespace :jruby do

  desc "Run :package and install the resulting .gem with jruby"
  task :install => :package do
    sh %{#{SUDO} jruby -S gem install pkg/#{NAME}-#{Merb::VERSION}.gem --no-rdoc --no-ri}
  end
  
end
