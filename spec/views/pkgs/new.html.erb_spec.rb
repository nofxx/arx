#require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

#describe "/pkgs/new.html.erb" do
#  include PkgsHelper
#
#  before(:each) do
#    assigns[:pkg] = stub_model(Pkg,
#      :new_record? => true,
#      :name => "value for name",
#      :desc => "value for desc",
#      :maintainer => ,
#      :repo => "value for repo"
#    )
#  end

#  it "should render new form" do
#    render "/pkgs/new.html.erb"
#
#    response.should have_tag("form[action=?][method=post]", pkgs_path) do
#      with_tag("input#pkg_name[name=?]", "pkg[name]")
#      with_tag("textarea#pkg_desc[name=?]", "pkg[desc]")
#      with_tag("input#pkg_maintainer[name=?]", "pkg[maintainer]")
#      with_tag("input#pkg_repo[name=?]", "pkg[repo]")
#    end
#  end
#end
