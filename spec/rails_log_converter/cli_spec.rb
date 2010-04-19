require 'spec_helper'

describe RailsLogConverter::CLI do
  before(:each) do
    @output = IO.new(0)
    @output.stubs(:puts)
    @valid_args = ['spec/files/simple_log']
  end
  
  it "should run and finish fully" do
    @output.expects(:puts).with('[DONE]')
    lambda{ RailsLogConverter::CLI.new(@valid_args, nil, @output).execute! }.should_not raise_error
  end
  
  after(:all) do
    #Remove Database file after you're done
    database_file = File.expand_path("#{File.dirname(__FILE__)}/../../#{@valid_args[0]}.db")
    File.delete(database_file) if File.exists?(database_file)
  end
end