require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/sources/new.html.erb" do
  include SourcesHelper
  
  before(:each) do
    assigns[:source] = stub_model(Source,
      :new_record? => true,
      :pkg => ,
      :url => "value for url",
      :state => "value for state"
    )
  end

  it "should render new form" do
    render "/sources/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", sources_path) do
      with_tag("input#source_pkg[name=?]", "source[pkg]")
      with_tag("input#source_url[name=?]", "source[url]")
      with_tag("input#source_state[name=?]", "source[state]")
    end
  end
end


