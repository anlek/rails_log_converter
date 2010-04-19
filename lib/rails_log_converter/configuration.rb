module RailsLogConverter
  class Configuration
    class << self
      attr_accessor :in_stream, :out_stream, :debug
      def debug?
        @debug || false
      end
    end
  end
end