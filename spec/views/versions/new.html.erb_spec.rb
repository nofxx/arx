require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/versions/new.html.erb" do
  include VersionsHelper
  
  before(:each) do
    assigns[:version] = stub_model(Version,
      :new_record? => true,
      :pkg => ,
      :name => "value for name",
      :desc => "value for desc"
    )
  end

  it "should render new form" do
    render "/versions/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", versions_path) do
      with_tag("input#version_pkg[name=?]", "version[pkg]")
      with_tag("input#version_name[name=?]", "version[name]")
      with_tag("textarea#version_desc[name=?]", "version[desc]")
    end
  end
end


