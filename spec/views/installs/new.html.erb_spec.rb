#require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

#describe "/installs/new.html.erb" do
#  include InstallsHelper
#
#  before(:each) do
#    assigns[:install] = stub_model(Install,
#      :new_record? => true,
#      :pkg => ,
#      :code => false
#    )
#  end

#  it "should render new form" do
#    render "/installs/new.html.erb"
#
#    response.should have_tag("form[action=?][method=post]", installs_path) do
#      with_tag("input#install_pkg[name=?]", "install[pkg]")
#      with_tag("input#install_code[name=?]", "install[code]")
#    end
#  end
#end
