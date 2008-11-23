require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/repos/new.html.erb" do
  include ReposHelper

  before(:each) do
    assigns[:repo] = stub_model(Repo,
      :new_record? => true,
      :user => nil,
      :path => "value for path"
    )
  end

  it "should render new form" do
    render "/repos/new.html.erb"

    response.should have_tag("form[action=?][method=post]", repos_path) do
      with_tag("input#repo_user[name=?]", "repo[user]")
      with_tag("input#repo_path[name=?]", "repo[path]")
    end
  end
end
