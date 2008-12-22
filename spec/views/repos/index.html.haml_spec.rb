require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/repos/index.html.haml" do
  include ReposHelper

  before(:each) do
    @pkg = stub_model(Pkg, :name => "rtorrent")
    assigns[:repos] = [
      stub_model(Repo,
        :pkg  => @pkg,
        :user => nil
      ),
      stub_model(Repo,
        :pkg  => @pkg,
        :user => nil
      )
    ]
  end

  it "should render list of repos" do
    render "/repos/index.html.haml"
  #  response.should have_tag("tr>td", "system" , 2)
    response.should have_tag("tr>td", "rtorrent", 2)
  end
end
