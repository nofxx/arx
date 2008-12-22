require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/sources/index.html.erb" do
  include SourcesHelper
  
  before(:each) do
    assigns[:sources] = [
      stub_model(Source,
        :pkg => ,
        :url => "value for url",
        :state => "value for state"
      ),
      stub_model(Source,
        :pkg => ,
        :url => "value for url",
        :state => "value for state"
      )
    ]
  end

  it "should render list of sources" do
    render "/sources/index.html.erb"
    response.should have_tag("tr>td", , 2)
    response.should have_tag("tr>td", "value for url", 2)
    response.should have_tag("tr>td", "value for state", 2)
  end
end

