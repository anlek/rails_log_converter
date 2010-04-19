module RailsLogConverter
  class CLI
    module Options
      module ClassMethods
        # Return a new CLI instance with the given arguments pre-parsed and
        # ready for execution.
        def parse(args)
          cli = new(args)
          cli
        end
      end
      
      def self.included(receiver)
        receiver.extend(ClassMethods)
      end
      
      
      # The hash of (parsed) command-line options
      attr_reader :options
      
      
      def option_parser
        @option_parser ||= OptionParser.new do |opts|
          script_name = File.basename($0)
          opts.banner = "USAGE: #{script_name} log_file.log"
          
          opts.on('-d', '--debug', 'Run application in debug mode') { |value| Configuration.debug = true }
                    
          opts.on("-h", "--help", "Show this message") do
            UI.puts opts
            exit
          end

          # Another typical switch to print the version.
          opts.on("-v","--version", "Show version") do
            UI.puts "#{script_name} version: #{RailsLogConverter::Version::STRING}"
            exit
          end
        end
      end
      
      def parse_options!
        
        option_parser.parse!(args)
        
        unless(args[0])
          warn "Log file not given"
          warn option_parser
          exit
        end
                
        self.file_path = File.expand_path(args[0])

        if !File.exists?(self.file_path)
          warn "#{self.file_path}' does not exist."
          exit
        elsif !File.file?(self.file_path)
          warn "#{self.file_path}' is not a file."
          exit
        elsif args.length > 2
          warn "Too many arguments;"
          warn option_parser
          exit
        end
      end      
    end
  end
end