require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/sources/edit.html.erb" do
  include SourcesHelper
  
  before(:each) do
    assigns[:source] = @source = stub_model(Source,
      :new_record? => false,
      :pkg => ,
      :url => "value for url",
      :state => "value for state"
    )
  end

  it "should render edit form" do
    render "/sources/edit.html.erb"
    
    response.should have_tag("form[action=#{source_path(@source)}][method=post]") do
      with_tag('input#source_pkg[name=?]', "source[pkg]")
      with_tag('input#source_url[name=?]', "source[url]")
      with_tag('input#source_state[name=?]', "source[state]")
    end
  end
end


