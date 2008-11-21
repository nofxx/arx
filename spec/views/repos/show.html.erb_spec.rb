require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/repos/show.html.erb" do
  include ReposHelper
  before(:each) do
    assigns[:repo] = @repo = stub_model(Repo,
      :user => ,
      :path => "value for path"
    )
  end

  it "should render attributes in <p>" do
    render "/repos/show.html.erb"
    response.should have_text(//)
    response.should have_text(/value\ for\ path/)
  end
end

