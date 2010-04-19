module RailsLogConverter
  class Parser
    class << self
      def parse_file(file_path)
        parser = self.new()
        parser.file_path = file_path
        parser.parse_file
        parser
      end
    end
    
    def initialize
      last_line = "not blank"
    end
    
    attr_accessor :file_path, :last_line
    
    def current_entry
      @current_entry ||= RailsLogConverter::Entry.new()
    end
    
    def parse_file
      raise "File #{file_path} is missing" unless File.exists?(file_path)
      UI.puts "Parsing File #{file_path}"
      File.open(file_path, 'r').each_line do |line|
        parse_line line.dup.chomp.strip
      end
      current_entry.save unless current_entry.controller.nil?
    end
    
    #######
    private
    #######
    def parse_line(line)
      case line
        when /^Processing(.*)/
          processing(line)
        when /^Session ID(.*)/
          session_id(line)
        when /^Parameters(.*)/
          parameters(line)
        when /^Completed/
          completed(line)
        when ''
          if(self.last_line == '')
            current_entry.save
            @current_entry = nil
            UI.info ">> Creating new Entry object"
          end
        else
          unknown(line)
      end
      self.last_line = line.dup
    end
    
    def processing(line)
      log_line_as('processing', line)
      ca = /(\w+)#(\w+)/.match(line)[0].split('#')
      current_entry.controller = ca[0]
      current_entry.action = ca[1]
      
      current_entry.ip = /\d{1,3}.\d{1,3}.\d{1,3}.\d{1,3}/.match(line)[0]
      
      current_entry.method = /\[(\w+)\]/.match(line)[1]
      
      current_entry.date = Time.parse(/\d{4}-\d{1,2}-\d{1,2}\s\d{1,2}:\d{2}:\d{2}/.match(line)[0])
    rescue
      unknown(line)
    end
    def session_id(line)
      log_line_as('session_id', line)
      current_entry.session_id = /\w+$/.match(line)[0]
    rescue
      unknown(line)
    end
    def parameters(line)
      log_line_as('parameters', line)
      begin
        hash = eval(/\{\}|\{"(.*)"=>"?(.*)"?\}$/.match(line)[0])
        current_entry.parameters = hash unless hash.empty?
      rescue
        UI.info "Error reading line: #{line}"
        unknown(line)
      end
    end
    def unknown(line)
      log_line_as('*unknown*', line)
      current_entry.other ||= []
      current_entry.other << line
    end
    def completed(line)
      log_line_as('completed', line)
      current_entry.completed_time = $1 if /^Completed in ([\d.]*)[\s|ms]/.match(line)
      current_entry.database_time = $1 if /DB: ([\d.]*)/.match(line)
      current_entry.req_per_sec = $1 if /\((\d+)\sreqs\/sec\)/.match(line)
      
      if /\|\s(\d*)\s(\w*)\s\[(.*)\]$/.match(line)
        current_entry.html_code = $1
        current_entry.url = $3
      end
    rescue
      UI.info ">>> Error writing complete line: #{line}"
      unknown(line)
    end
    
    def log_line_as(action, line)
      message = "LINE: #{line}\n  ACTION TAKEN: #{action}\n---"
      UI.info message
    end
  end
end