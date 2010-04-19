module RailsLogConverter
  class Entry < ActiveRecord::Base
    serialize :parameters
    serialize :other    
  end
end