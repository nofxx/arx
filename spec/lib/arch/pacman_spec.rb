require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')
require File.expand_path(File.dirname(__FILE__) + '/../../../lib/arch/pacman.rb')

describe Arch::Pacman do

  def mock_pkg
    @mock_pkg = mock_model(Pkg, :versions => [])
  end


  it "should get a list" do
    Kernel.should_receive(:system).
      with("yaourt -Sl --textonly --nocolor &> tmp/pacman.txt").
      and_return(true)
    Arch::Pacman.sy.should be_true
  end




#  it "should parse a row" do
#    Pkg.should_receive(:create).with(:name => "your-freedom", :desc => 'todo').
#      and_return(mock_pkg)
#    #@mock_pkg.stub!(:versions).and_return(true) #.build(:name => @version) unless @pkg.versions.map(&:name).include? @version


#    Arch::Pacman.process("community your-freedom 20080619-1").
#     should eql(["community", "your-freedom", "20080619-1"])

#  end


end
