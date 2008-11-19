require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/installs/index.html.erb" do
  include InstallsHelper
  
  before(:each) do
    assigns[:installs] = [
      stub_model(Install,
        :pkg => ,
        :code => false
      ),
      stub_model(Install,
        :pkg => ,
        :code => false
      )
    ]
  end

  it "should render list of installs" do
    render "/installs/index.html.erb"
    response.should have_tag("tr>td", , 2)
    response.should have_tag("tr>td", false, 2)
  end
end

