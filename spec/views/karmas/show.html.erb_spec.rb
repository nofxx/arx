require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/karmas/show.html.erb" do
  include KarmasHelper
  before(:each) do
    assigns[:karma] = @karma = stub_model(Karma,
      :pkg => ,
      :value => "1",
      :user => ,
      :version => 
    )
  end

  it "should render attributes in <p>" do
    render "/karmas/show.html.erb"
    response.should have_text(//)
    response.should have_text(/1/)
    response.should have_text(//)
    response.should have_text(//)
  end
end

