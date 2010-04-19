$: << File.dirname(__FILE__)
require 'rubygems'
require 'sqlite3'
require 'active_record'

require 'core_ext/object'

require 'rails_log_converter/ui'
require 'rails_log_converter/version'
require 'rails_log_converter/configuration'
require 'rails_log_converter/entry'
require 'rails_log_converter/parser'

require 'rails_log_converter/cli'