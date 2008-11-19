require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/versions/show.html.erb" do
  include VersionsHelper
  before(:each) do
    assigns[:version] = @version = stub_model(Version,
      :pkg => ,
      :name => "value for name",
      :desc => "value for desc"
    )
  end

  it "should render attributes in <p>" do
    render "/versions/show.html.erb"
    response.should have_text(//)
    response.should have_text(/value\ for\ name/)
    response.should have_text(/value\ for\ desc/)
  end
end

