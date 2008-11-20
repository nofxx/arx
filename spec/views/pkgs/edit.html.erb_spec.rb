#require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

#describe "/pkgs/edit.html.erb" do
#  include PkgsHelper
#
#  before(:each) do
#    assigns[:pkg] = @pkg = stub_model(Pkg,
#      :new_record? => false,
#      :name => "value for name",
#      :desc => "value for desc",
#      :maintainer => ,
#      :repo => "value for repo"
#    )
#  end

#  it "should render edit form" do
#    render "/pkgs/edit.html.erb"
#
#    response.should have_tag("form[action=#{pkg_path(@pkg)}][method=post]") do
#      with_tag('input#pkg_name[name=?]', "pkg[name]")
#      with_tag('textarea#pkg_desc[name=?]', "pkg[desc]")
#      with_tag('input#pkg_maintainer[name=?]', "pkg[maintainer]")
#      with_tag('input#pkg_repo[name=?]', "pkg[repo]")
#    end
#  end
#end
