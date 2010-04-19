require 'optparse'

require 'rails_log_converter/cli/options'
require 'rails_log_converter/cli/execute'

module RailsLogConverter
  class CLI
    attr_reader :args
    attr_accessor :file_path
    include Execute, Options
    
    def initialize(arguments, stdin=$stdin, stdout=$stdout)
      @args = arguments.dup
      RailsLogConverter::Configuration.in_stream = stdin
      RailsLogConverter::Configuration.out_stream = stdout
      parse_options!
    end
    
    def file_name
      File.basename file_path
    end
    
    def directory_path
      File.dirname file_path
    end
    
    def database_name
      "#{file_name}.db"
    end
  end
end