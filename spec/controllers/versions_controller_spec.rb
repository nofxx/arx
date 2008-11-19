require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe VersionsController do

  def mock_version(stubs={})
    @mock_version ||= mock_model(Version, stubs)
  end
  
  describe "responding to GET index" do

    it "should expose all versions as @versions" do
      Version.should_receive(:find).with(:all).and_return([mock_version])
      get :index
      assigns[:versions].should == [mock_version]
    end

    describe "with mime type of xml" do
  
      it "should render all versions as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Version.should_receive(:find).with(:all).and_return(versions = mock("Array of Versions"))
        versions.should_receive(:to_xml).and_return("generated XML")
        get :index
        response.body.should == "generated XML"
      end
    
    end

  end

  describe "responding to GET show" do

    it "should expose the requested version as @version" do
      Version.should_receive(:find).with("37").and_return(mock_version)
      get :show, :id => "37"
      assigns[:version].should equal(mock_version)
    end
    
    describe "with mime type of xml" do

      it "should render the requested version as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Version.should_receive(:find).with("37").and_return(mock_version)
        mock_version.should_receive(:to_xml).and_return("generated XML")
        get :show, :id => "37"
        response.body.should == "generated XML"
      end

    end
    
  end

  describe "responding to GET new" do
  
    it "should expose a new version as @version" do
      Version.should_receive(:new).and_return(mock_version)
      get :new
      assigns[:version].should equal(mock_version)
    end

  end

  describe "responding to GET edit" do
  
    it "should expose the requested version as @version" do
      Version.should_receive(:find).with("37").and_return(mock_version)
      get :edit, :id => "37"
      assigns[:version].should equal(mock_version)
    end

  end

  describe "responding to POST create" do

    describe "with valid params" do
      
      it "should expose a newly created version as @version" do
        Version.should_receive(:new).with({'these' => 'params'}).and_return(mock_version(:save => true))
        post :create, :version => {:these => 'params'}
        assigns(:version).should equal(mock_version)
      end

      it "should redirect to the created version" do
        Version.stub!(:new).and_return(mock_version(:save => true))
        post :create, :version => {}
        response.should redirect_to(version_url(mock_version))
      end
      
    end
    
    describe "with invalid params" do

      it "should expose a newly created but unsaved version as @version" do
        Version.stub!(:new).with({'these' => 'params'}).and_return(mock_version(:save => false))
        post :create, :version => {:these => 'params'}
        assigns(:version).should equal(mock_version)
      end

      it "should re-render the 'new' template" do
        Version.stub!(:new).and_return(mock_version(:save => false))
        post :create, :version => {}
        response.should render_template('new')
      end
      
    end
    
  end

  describe "responding to PUT udpate" do

    describe "with valid params" do

      it "should update the requested version" do
        Version.should_receive(:find).with("37").and_return(mock_version)
        mock_version.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :version => {:these => 'params'}
      end

      it "should expose the requested version as @version" do
        Version.stub!(:find).and_return(mock_version(:update_attributes => true))
        put :update, :id => "1"
        assigns(:version).should equal(mock_version)
      end

      it "should redirect to the version" do
        Version.stub!(:find).and_return(mock_version(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(version_url(mock_version))
      end

    end
    
    describe "with invalid params" do

      it "should update the requested version" do
        Version.should_receive(:find).with("37").and_return(mock_version)
        mock_version.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :version => {:these => 'params'}
      end

      it "should expose the version as @version" do
        Version.stub!(:find).and_return(mock_version(:update_attributes => false))
        put :update, :id => "1"
        assigns(:version).should equal(mock_version)
      end

      it "should re-render the 'edit' template" do
        Version.stub!(:find).and_return(mock_version(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "responding to DELETE destroy" do

    it "should destroy the requested version" do
      Version.should_receive(:find).with("37").and_return(mock_version)
      mock_version.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "should redirect to the versions list" do
      Version.stub!(:find).and_return(mock_version(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(versions_url)
    end

  end

end
