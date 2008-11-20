#require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

#describe "/pkgs/show.html.erb" do
#  include PkgsHelper
#  before(:each) do
#    assigns[:pkg] = @pkg = stub_model(Pkg,
#      :name => "value for name",
#      :desc => "value for desc",
#      :maintainer => ,
#      :repo => "value for repo"
#    )
#  end

#  it "should render attributes in <p>" do
#    render "/pkgs/show.html.erb"
#    response.should have_text(/value\ for\ name/)
#    response.should have_text(/value\ for\ desc/)
#    response.should have_text(//)
#    response.should have_text(/value\ for\ repo/)
#  end
#end
