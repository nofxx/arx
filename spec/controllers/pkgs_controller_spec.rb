require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe PkgsController do

  def mock_pkg(stubs={})
    @mock_pkg ||= mock_model(Pkg, stubs)
  end
  
  describe "responding to GET index" do

    it "should expose all pkgs as @pkgs" do
      Pkg.should_receive(:find).with(:all).and_return([mock_pkg])
      get :index
      assigns[:pkgs].should == [mock_pkg]
    end

    describe "with mime type of xml" do
  
      it "should render all pkgs as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Pkg.should_receive(:find).with(:all).and_return(pkgs = mock("Array of Pkgs"))
        pkgs.should_receive(:to_xml).and_return("generated XML")
        get :index
        response.body.should == "generated XML"
      end
    
    end

  end

  describe "responding to GET show" do

    it "should expose the requested pkg as @pkg" do
      Pkg.should_receive(:find).with("37").and_return(mock_pkg)
      get :show, :id => "37"
      assigns[:pkg].should equal(mock_pkg)
    end
    
    describe "with mime type of xml" do

      it "should render the requested pkg as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Pkg.should_receive(:find).with("37").and_return(mock_pkg)
        mock_pkg.should_receive(:to_xml).and_return("generated XML")
        get :show, :id => "37"
        response.body.should == "generated XML"
      end

    end
    
  end

  describe "responding to GET new" do
  
    it "should expose a new pkg as @pkg" do
      Pkg.should_receive(:new).and_return(mock_pkg)
      get :new
      assigns[:pkg].should equal(mock_pkg)
    end

  end

  describe "responding to GET edit" do
  
    it "should expose the requested pkg as @pkg" do
      Pkg.should_receive(:find).with("37").and_return(mock_pkg)
      get :edit, :id => "37"
      assigns[:pkg].should equal(mock_pkg)
    end

  end

  describe "responding to POST create" do

    describe "with valid params" do
      
      it "should expose a newly created pkg as @pkg" do
        Pkg.should_receive(:new).with({'these' => 'params'}).and_return(mock_pkg(:save => true))
        post :create, :pkg => {:these => 'params'}
        assigns(:pkg).should equal(mock_pkg)
      end

      it "should redirect to the created pkg" do
        Pkg.stub!(:new).and_return(mock_pkg(:save => true))
        post :create, :pkg => {}
        response.should redirect_to(pkg_url(mock_pkg))
      end
      
    end
    
    describe "with invalid params" do

      it "should expose a newly created but unsaved pkg as @pkg" do
        Pkg.stub!(:new).with({'these' => 'params'}).and_return(mock_pkg(:save => false))
        post :create, :pkg => {:these => 'params'}
        assigns(:pkg).should equal(mock_pkg)
      end

      it "should re-render the 'new' template" do
        Pkg.stub!(:new).and_return(mock_pkg(:save => false))
        post :create, :pkg => {}
        response.should render_template('new')
      end
      
    end
    
  end

  describe "responding to PUT udpate" do

    describe "with valid params" do

      it "should update the requested pkg" do
        Pkg.should_receive(:find).with("37").and_return(mock_pkg)
        mock_pkg.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :pkg => {:these => 'params'}
      end

      it "should expose the requested pkg as @pkg" do
        Pkg.stub!(:find).and_return(mock_pkg(:update_attributes => true))
        put :update, :id => "1"
        assigns(:pkg).should equal(mock_pkg)
      end

      it "should redirect to the pkg" do
        Pkg.stub!(:find).and_return(mock_pkg(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(pkg_url(mock_pkg))
      end

    end
    
    describe "with invalid params" do

      it "should update the requested pkg" do
        Pkg.should_receive(:find).with("37").and_return(mock_pkg)
        mock_pkg.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :pkg => {:these => 'params'}
      end

      it "should expose the pkg as @pkg" do
        Pkg.stub!(:find).and_return(mock_pkg(:update_attributes => false))
        put :update, :id => "1"
        assigns(:pkg).should equal(mock_pkg)
      end

      it "should re-render the 'edit' template" do
        Pkg.stub!(:find).and_return(mock_pkg(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "responding to DELETE destroy" do

    it "should destroy the requested pkg" do
      Pkg.should_receive(:find).with("37").and_return(mock_pkg)
      mock_pkg.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "should redirect to the pkgs list" do
      Pkg.stub!(:find).and_return(mock_pkg(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(pkgs_url)
    end

  end

end
