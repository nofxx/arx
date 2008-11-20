#require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

#describe "/versions/index.html.erb" do
#  include VersionsHelper
#
#  before(:each) do
#    assigns[:versions] = [
#      stub_model(Version,
#        :pkg => ,
#        :name => "value for name",
#        :desc => "value for desc"
#      ),
#      stub_model(Version,
#        :pkg => ,
#        :name => "value for name",
#        :desc => "value for desc"
#      )
#    ]
#  end

#  it "should render list of versions" do
#    render "/versions/index.html.erb"
#    response.should have_tag("tr>td", , 2)
#    response.should have_tag("tr>td", "value for name", 2)
#    response.should have_tag("tr>td", "value for desc", 2)
#  end
#end
