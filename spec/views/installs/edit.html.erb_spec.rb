require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/installs/edit.html.erb" do
  include InstallsHelper
  
  before(:each) do
    assigns[:install] = @install = stub_model(Install,
      :new_record? => false,
      :pkg => ,
      :code => false
    )
  end

  it "should render edit form" do
    render "/installs/edit.html.erb"
    
    response.should have_tag("form[action=#{install_path(@install)}][method=post]") do
      with_tag('input#install_pkg[name=?]', "install[pkg]")
      with_tag('input#install_code[name=?]', "install[code]")
    end
  end
end


