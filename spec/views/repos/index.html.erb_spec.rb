require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/repos/index.html.erb" do
  include ReposHelper
  
  before(:each) do
    assigns[:repos] = [
      stub_model(Repo,
        :user => ,
        :path => "value for path"
      ),
      stub_model(Repo,
        :user => ,
        :path => "value for path"
      )
    ]
  end

  it "should render list of repos" do
    render "/repos/index.html.erb"
    response.should have_tag("tr>td", , 2)
    response.should have_tag("tr>td", "value for path", 2)
  end
end

