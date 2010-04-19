module RailsLogConverter
  class CLI
    module Execute
      def self.included(receiver)
        receiver.extend ClassMethods
      end
      
      module ClassMethods
        def execute
          parse(ARGV).execute!
        end
        
        def setup_logger
          ActiveRecord::Base.logger = Logger.new(Configuration.out_stream)
          ActiveRecord::Base.logger.level = Logger::WARN
        end
        
        def create_database(path)
          ActiveRecord::Base.establish_connection(
            :adapter => "sqlite3",
            :database => path
          )
          UI.puts "Saving output file to #{path}"
          ActiveRecord::Base.connection

          ActiveRecord::Migration.verbose = Configuration.debug?
          ActiveRecord::Migrator.migrate(File.expand_path(File.dirname(__FILE__) + "/../db"), nil)
        end
        
        def close_database
          ActiveRecord::Base.connection.disconnect!
        end
      end
      
      
            
      def create_database
        CLI.setup_logger
        
        path = "#{directory_path}/#{database_name}"
        File.delete path if File.exists?(path)
        
        CLI.create_database(path)
      end
      
      def close_database
        CLI.close_database
      end
      
      
      
      def execute!
        create_database
        Parser.parse_file(file_path)
        close_database
        UI.puts "[DONE]"
      end
    end
  end
  
end