require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/repos/edit.html.erb" do
  include ReposHelper
  
  before(:each) do
    assigns[:repo] = @repo = stub_model(Repo,
      :new_record? => false,
      :user => ,
      :path => "value for path"
    )
  end

  it "should render edit form" do
    render "/repos/edit.html.erb"
    
    response.should have_tag("form[action=#{repo_path(@repo)}][method=post]") do
      with_tag('input#repo_user[name=?]', "repo[user]")
      with_tag('input#repo_path[name=?]', "repo[path]")
    end
  end
end


