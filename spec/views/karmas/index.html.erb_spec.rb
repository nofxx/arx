require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/karmas/index.html.erb" do
  include KarmasHelper
  
  before(:each) do
    assigns[:karmas] = [
      stub_model(Karma,
        :pkg => ,
        :value => "1",
        :user => ,
        :version => 
      ),
      stub_model(Karma,
        :pkg => ,
        :value => "1",
        :user => ,
        :version => 
      )
    ]
  end

  it "should render list of karmas" do
    render "/karmas/index.html.erb"
    response.should have_tag("tr>td", , 2)
    response.should have_tag("tr>td", "1", 2)
    response.should have_tag("tr>td", , 2)
    response.should have_tag("tr>td", , 2)
  end
end

