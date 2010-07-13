# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{processr}
  s.version = "0.5.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Josh Nesbitt"]
  s.date = %q{2010-07-13}
  s.description = %q{Processr provides a really simple interface to processing a set of text files. Through the use of filters you can further modify output before writing the contents to a file.}
  s.email = %q{josh@josh-nesbitt.net}
  s.extra_rdoc_files = [
    "LICENSE",
     "TODO"
  ]
  s.files = [
    ".gitignore",
     "LICENSE",
     "Rakefile",
     "TODO",
     "VERSION",
     "examples/all.rb",
     "examples/one.txt",
     "examples/output.txt",
     "examples/text.textile",
     "examples/two.txt",
     "lib/processr.rb",
     "processr.gemspec",
     "readme.rdoc",
     "spec/fixtures/one.js",
     "spec/fixtures/two.js",
     "spec/lib/processr_spec.rb",
     "spec/spec_helper.rb",
     "spec/watch.rb"
  ]
  s.homepage = %q{http://github.com/joshnesbitt/processr}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.6}
  s.summary = %q{A simple text processing library}
  s.test_files = [
    "spec/lib/processr_spec.rb",
     "spec/spec_helper.rb",
     "spec/watch.rb",
     "examples/all.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rspec>, [">= 1.2.9"])
    else
      s.add_dependency(%q<rspec>, [">= 1.2.9"])
    end
  else
    s.add_dependency(%q<rspec>, [">= 1.2.9"])
  end
end

