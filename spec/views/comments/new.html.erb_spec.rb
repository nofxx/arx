#require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

#describe "/comments/new.html.erb" do
#  include CommentsHelper
#
#  before(:each) do
#    assigns[:comment] = stub_model(Comment,
#      :new_record? => true,
#      :user => ,
#      :pkg => ,
#      :content => "value for content"
#    )
#  end

#  it "should render new form" do
#    render "/comments/new.html.erb"
#
#    response.should have_tag("form[action=?][method=post]", comments_path) do
#      with_tag("input#comment_user[name=?]", "comment[user]")
#      with_tag("input#comment_pkg[name=?]", "comment[pkg]")
#      with_tag("textarea#comment_content[name=?]", "comment[content]")
#    end
#  end
#end
