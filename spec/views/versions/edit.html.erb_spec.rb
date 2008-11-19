require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/versions/edit.html.erb" do
  include VersionsHelper
  
  before(:each) do
    assigns[:version] = @version = stub_model(Version,
      :new_record? => false,
      :pkg => ,
      :name => "value for name",
      :desc => "value for desc"
    )
  end

  it "should render edit form" do
    render "/versions/edit.html.erb"
    
    response.should have_tag("form[action=#{version_path(@version)}][method=post]") do
      with_tag('input#version_pkg[name=?]', "version[pkg]")
      with_tag('input#version_name[name=?]', "version[name]")
      with_tag('textarea#version_desc[name=?]', "version[desc]")
    end
  end
end


