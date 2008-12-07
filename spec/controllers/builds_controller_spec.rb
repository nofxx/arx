require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe BuildsController do

  def mock_build(stubs={})
    @mock_build ||= mock_model(Build, stubs)
  end

  describe "responding to GET index" do

    it "should expose all builds as @builds" do
      Build.should_receive(:find).with(:all).and_return([mock_build])
      get :index
      assigns[:builds].should == [mock_build]
    end

    describe "with mime type of xml" do

      it "should render all builds as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Build.should_receive(:find).with(:all).and_return(builds = mock("Array of Builds"))
        builds.should_receive(:to_xml).and_return("generated XML")
        get :index
        response.body.should == "generated XML"
      end

    end

  end

  describe "responding to GET show" do

    it "should expose the requested build as @build" do
      Build.should_receive(:find).with("37").and_return(mock_build)
      get :show, :id => "37"
      assigns[:build].should equal(mock_build)
    end

    describe "with mime type of xml" do

      it "should render the requested build as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Build.should_receive(:find).with("37").and_return(mock_build)
        mock_build.should_receive(:to_xml).and_return("generated XML")
        get :show, :id => "37"
        response.body.should == "generated XML"
      end

    end

  end

  describe "responding to GET new" do

    it "should expose a new build as @build" do
      Build.should_receive(:new).and_return(mock_build)
      get :new
      assigns[:build].should equal(mock_build)
    end

  end

  describe "responding to GET edit" do

    it "should expose the requested build as @build" do
      Build.should_receive(:find).with("37").and_return(mock_build)
      get :edit, :id => "37"
      assigns[:build].should equal(mock_build)
    end

  end

  describe "responding to POST create" do

    describe "with valid params" do

      it "should expose a newly created build as @build" do
        Build.should_receive(:new).with({'these' => 'params'}).and_return(mock_build(:save => true))
        post :create, :build => {:these => 'params'}
        assigns(:build).should equal(mock_build)
      end

      it "should redirect to the created build" do
        Build.stub!(:new).and_return(mock_build(:save => true))
        post :create, :build => {}
        response.should redirect_to(build_url(mock_build))
      end

    end

    describe "with invalid params" do

      it "should expose a newly created but unsaved build as @build" do
        Build.stub!(:new).with({'these' => 'params'}).and_return(mock_build(:save => false))
        post :create, :build => {:these => 'params'}
        assigns(:build).should equal(mock_build)
      end

      it "should re-render the 'new' template" do
        Build.stub!(:new).and_return(mock_build(:save => false))
        post :create, :build => {}
        response.should render_template('new')
      end

    end

  end

  describe "responding to PUT udpate" do

    describe "with valid params" do

      it "should update the requested build" do
        Build.should_receive(:find).with("37").and_return(mock_build)
        mock_build.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :build => {:these => 'params'}
      end

      it "should expose the requested build as @build" do
        Build.stub!(:find).and_return(mock_build(:update_attributes => true))
        put :update, :id => "1"
        assigns(:build).should equal(mock_build)
      end

      it "should redirect to the build" do
        Build.stub!(:find).and_return(mock_build(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(build_url(mock_build))
      end

    end

    describe "with invalid params" do

      it "should update the requested build" do
        Build.should_receive(:find).with("37").and_return(mock_build)
        mock_build.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :build => {:these => 'params'}
      end

      it "should expose the build as @build" do
        Build.stub!(:find).and_return(mock_build(:update_attributes => false))
        put :update, :id => "1"
        assigns(:build).should equal(mock_build)
      end

      it "should re-render the 'edit' template" do
        Build.stub!(:find).and_return(mock_build(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "responding to DELETE destroy" do

    it "should destroy the requested build" do
      Build.should_receive(:find).with("37").and_return(mock_build)
      mock_build.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "should redirect to the builds list" do
      Build.stub!(:find).and_return(mock_build(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(builds_url)
    end

  end

end
