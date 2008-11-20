#require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

#describe "/karmas/new.html.erb" do
#  include KarmasHelper
#
#  before(:each) do
#    assigns[:karma] = stub_model(Karma,
#      :new_record? => true,
#      :pkg => ,
#      :value => "1",
#      :user => ,
#      :version =>
#    )
#  end

#  it "should render new form" do
#    render "/karmas/new.html.erb"
#
#    response.should have_tag("form[action=?][method=post]", karmas_path) do
#      with_tag("input#karma_pkg[name=?]", "karma[pkg]")
#      with_tag("input#karma_value[name=?]", "karma[value]")
#      with_tag("input#karma_user[name=?]", "karma[user]")
#      with_tag("input#karma_version[name=?]", "karma[version]")
#    end
#  end
#end
