require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/repos/show.html.haml" do
  include ReposHelper
  before(:each) do
    @pkg = stub_model(Pkg, :name => "rtorrent")
    @usr = stub_model(User, :name => "joao")
    assigns[:repo] = @repo = stub_model(Repo,
      :pkg => @pkg,
      :user => @usr,
      :empty? => true
    )
  end

  it "should render attributes in <p>" do
    render "/repos/show.html.haml"
    response.should have_text(/rtorrent/)
    response.should have_text(/joao/)
  end
end
