require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/comments/edit.html.erb" do
  include CommentsHelper

  before(:each) do
    assigns[:comment] = @comment = stub_model(Comment,
      :new_record? => false,
      :user => stub_model(User),
      :pkg => stub_model(Pkg),
      :content => "value for content"
    )
  end

  it "should render edit form" do
    render "/comments/edit.html.erb"

    response.should have_tag("form[action=#{comment_path(@comment)}][method=post]") do
      with_tag('input#comment_user[name=?]', "comment[user]")
      with_tag('input#comment_pkg[name=?]', "comment[pkg]")
      with_tag('textarea#comment_content[name=?]', "comment[content]")
    end
  end
end
