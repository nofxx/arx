#require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

#describe "/pkgs/index.html.erb" do
#  include PkgsHelper
#
#  before(:each) do
#    assigns[:pkgs] = [
#      stub_model(Pkg,
#        :name => "value for name",
#        :desc => "value for desc",
#        :maintainer => ,
#        :repo => "value for repo"
#      ),
#      stub_model(Pkg,
#        :name => "value for name",
#        :desc => "value for desc",
#        :maintainer => ,
#        :repo => "value for repo"
#      )
#    ]
#  end

#  it "should render list of pkgs" do
#    render "/pkgs/index.html.erb"
#    response.should have_tag("tr>td", "value for name", 2)
#    response.should have_tag("tr>td", "value for desc", 2)
#    response.should have_tag("tr>td", , 2)
#    response.should have_tag("tr>td", "value for repo", 2)
#  end
#end
