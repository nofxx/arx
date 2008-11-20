#require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

#describe "/karmas/edit.html.erb" do
#  include KarmasHelper
#
#  before(:each) do
#    assigns[:karma] = @karma = stub_model(Karma,
#      :new_record? => false,
#      :pkg => ,
#      :value => "1",
#      :user => ,
#      :version =>
#    )
#  end

#  it "should render edit form" do
#    render "/karmas/edit.html.erb"
#
#    response.should have_tag("form[action=#{karma_path(@karma)}][method=post]") do
#      with_tag('input#karma_pkg[name=?]', "karma[pkg]")
#      with_tag('input#karma_value[name=?]', "karma[value]")
#      with_tag('input#karma_user[name=?]', "karma[user]")
#      with_tag('input#karma_version[name=?]', "karma[version]")
#    end
#  end
#end
