require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/sources/show.html.erb" do
  include SourcesHelper
  before(:each) do
    assigns[:source] = @source = stub_model(Source,
      :pkg => ,
      :url => "value for url",
      :state => "value for state"
    )
  end

  it "should render attributes in <p>" do
    render "/sources/show.html.erb"
    response.should have_text(//)
    response.should have_text(/value\ for\ url/)
    response.should have_text(/value\ for\ state/)
  end
end

