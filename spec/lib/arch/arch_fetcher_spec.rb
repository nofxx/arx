require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')
require File.expand_path(File.dirname(__FILE__) + '/../../../lib/arch/arch_fetcher.rb')

describe Arch::Fetcher do


  it "should get a list" do
    Arch::Fetcher.get_list.should eql(" ")
  end

  it "should parse a row" do

    Arch::Fetcher.read_row("community your-freedom 20080619-1").
     should eql(["community", "your-freedom", "20080619-1"])

  end


end
