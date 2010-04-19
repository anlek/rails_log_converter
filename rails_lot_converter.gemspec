# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{rails_lot_converter}
  s.version = "0.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["Andrew Kalek"]
  s.date = %q{2010-04-19}
  s.default_executable = %q{rails_log_converter}
  s.description = %q{A little app that parses through your rails log file and converts it into a SQLite database.}
  s.email = %q{andrew.kalek@anlek.com}
  s.executables = ["rails_log_converter"]
  s.extra_rdoc_files = ["CHANGELOG.rdoc", "README.rdoc", "lib/core_ext/object.rb", "lib/rails_log_converter.rb", "lib/rails_log_converter/cli.rb", "lib/rails_log_converter/cli/execute.rb", "lib/rails_log_converter/cli/options.rb", "lib/rails_log_converter/configuration.rb", "lib/rails_log_converter/db/001_entry_migration.rb", "lib/rails_log_converter/entry.rb", "lib/rails_log_converter/parser.rb", "lib/rails_log_converter/ui.rb", "lib/rails_log_converter/version.rb"]
  s.files = ["CHANGELOG.rdoc", "Manifest", "README.rdoc", "Rakefile", "bin/rails_log_converter", "lib/core_ext/object.rb", "lib/rails_log_converter.rb", "lib/rails_log_converter/cli.rb", "lib/rails_log_converter/cli/execute.rb", "lib/rails_log_converter/cli/options.rb", "lib/rails_log_converter/configuration.rb", "lib/rails_log_converter/db/001_entry_migration.rb", "lib/rails_log_converter/entry.rb", "lib/rails_log_converter/parser.rb", "lib/rails_log_converter/ui.rb", "lib/rails_log_converter/version.rb", "rails_lot_converter.gemspec", "spec/files/simple_log", "spec/rails_log_converter/cli_spec.rb", "spec/spec.opts", "spec/spec_helper.rb"]
  s.homepage = %q{http://github.com/anlek/rails_log_converter}
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Rails_lot_converter", "--main", "README.rdoc"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{rails_lot_converter}
  s.rubygems_version = %q{1.3.6}
  s.summary = %q{A little app that parses through your rails log file and converts it into a SQLite database.}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<sqlite3-ruby>, [">= 1.2.5"])
      s.add_runtime_dependency(%q<activerecord>, [">= 2.0"])
      s.add_development_dependency(%q<rspec>, [">= 1.3"])
      s.add_development_dependency(%q<mocha>, [">= 0.9.8"])
      s.add_development_dependency(%q<yard>, [">= 0.5.3"])
    else
      s.add_dependency(%q<sqlite3-ruby>, [">= 1.2.5"])
      s.add_dependency(%q<activerecord>, [">= 2.0"])
      s.add_dependency(%q<rspec>, [">= 1.3"])
      s.add_dependency(%q<mocha>, [">= 0.9.8"])
      s.add_dependency(%q<yard>, [">= 0.5.3"])
    end
  else
    s.add_dependency(%q<sqlite3-ruby>, [">= 1.2.5"])
    s.add_dependency(%q<activerecord>, [">= 2.0"])
    s.add_dependency(%q<rspec>, [">= 1.3"])
    s.add_dependency(%q<mocha>, [">= 0.9.8"])
    s.add_dependency(%q<yard>, [">= 0.5.3"])
  end
end
