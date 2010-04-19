require 'rake'
require 'spec/rake/spectask'
require "./lib/rails_log_converter/version"

begin
  require 'echoe'
rescue LoadError
  abort "You'll need to have `echoe' installed to use Echo's Rakefile"
end
 
version = RailsLogConverter::Version::STRING.dup
if ENV['SNAPSHOT'].to_i == 1
  version << "." << Time.now.utc.strftime("%Y%m%d%H%M%S")
end

Echoe.new('rails_lot_converter', version) do |p|
  p.changelog            = 'CHANGELOG.rdoc'
  
  p.author                = 'Andrew Kalek'
  p.email                 = 'andrew.kalek@anlek.com'
  
  p.ignore_pattern = ["tmp/*", "script/*", "Examples/*"]
  
  p.summary = <<-DESC.strip.gsub(/\n\s+/, " ")
    Convert your rails log files into a SQLite database.
  DESC
  
  p.url = "http://github.com/anlek/rails_log_converter"
  p.rdoc_pattern = /^(lib|README.rdoc|CHANGELOG.rdoc|LICENSE)/
  
  p.development_dependencies = ['rspec >=1.3', 'mocha >=0.9.8', 'yard >=0.5.3']
  p.runtime_dependencies = ['sqlite3-ruby >=1.2.5', 'activerecord >=2.0']
end
 
spec_files = Rake::FileList["spec/**/*_spec.rb"]
 
desc "Run specs"
Spec::Rake::SpecTask.new do |t|
  t.spec_files = spec_files
  t.spec_opts = ["-c"]
end
 
task :default => :spec

Dir["#{File.dirname(__FILE__)}/tasks/*.rake"].sort.each { |ext| load ext }