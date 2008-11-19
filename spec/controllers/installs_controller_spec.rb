require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe InstallsController do

  def mock_install(stubs={})
    @mock_install ||= mock_model(Install, stubs)
  end
  
  describe "responding to GET index" do

    it "should expose all installs as @installs" do
      Install.should_receive(:find).with(:all).and_return([mock_install])
      get :index
      assigns[:installs].should == [mock_install]
    end

    describe "with mime type of xml" do
  
      it "should render all installs as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Install.should_receive(:find).with(:all).and_return(installs = mock("Array of Installs"))
        installs.should_receive(:to_xml).and_return("generated XML")
        get :index
        response.body.should == "generated XML"
      end
    
    end

  end

  describe "responding to GET show" do

    it "should expose the requested install as @install" do
      Install.should_receive(:find).with("37").and_return(mock_install)
      get :show, :id => "37"
      assigns[:install].should equal(mock_install)
    end
    
    describe "with mime type of xml" do

      it "should render the requested install as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Install.should_receive(:find).with("37").and_return(mock_install)
        mock_install.should_receive(:to_xml).and_return("generated XML")
        get :show, :id => "37"
        response.body.should == "generated XML"
      end

    end
    
  end

  describe "responding to GET new" do
  
    it "should expose a new install as @install" do
      Install.should_receive(:new).and_return(mock_install)
      get :new
      assigns[:install].should equal(mock_install)
    end

  end

  describe "responding to GET edit" do
  
    it "should expose the requested install as @install" do
      Install.should_receive(:find).with("37").and_return(mock_install)
      get :edit, :id => "37"
      assigns[:install].should equal(mock_install)
    end

  end

  describe "responding to POST create" do

    describe "with valid params" do
      
      it "should expose a newly created install as @install" do
        Install.should_receive(:new).with({'these' => 'params'}).and_return(mock_install(:save => true))
        post :create, :install => {:these => 'params'}
        assigns(:install).should equal(mock_install)
      end

      it "should redirect to the created install" do
        Install.stub!(:new).and_return(mock_install(:save => true))
        post :create, :install => {}
        response.should redirect_to(install_url(mock_install))
      end
      
    end
    
    describe "with invalid params" do

      it "should expose a newly created but unsaved install as @install" do
        Install.stub!(:new).with({'these' => 'params'}).and_return(mock_install(:save => false))
        post :create, :install => {:these => 'params'}
        assigns(:install).should equal(mock_install)
      end

      it "should re-render the 'new' template" do
        Install.stub!(:new).and_return(mock_install(:save => false))
        post :create, :install => {}
        response.should render_template('new')
      end
      
    end
    
  end

  describe "responding to PUT udpate" do

    describe "with valid params" do

      it "should update the requested install" do
        Install.should_receive(:find).with("37").and_return(mock_install)
        mock_install.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :install => {:these => 'params'}
      end

      it "should expose the requested install as @install" do
        Install.stub!(:find).and_return(mock_install(:update_attributes => true))
        put :update, :id => "1"
        assigns(:install).should equal(mock_install)
      end

      it "should redirect to the install" do
        Install.stub!(:find).and_return(mock_install(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(install_url(mock_install))
      end

    end
    
    describe "with invalid params" do

      it "should update the requested install" do
        Install.should_receive(:find).with("37").and_return(mock_install)
        mock_install.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :install => {:these => 'params'}
      end

      it "should expose the install as @install" do
        Install.stub!(:find).and_return(mock_install(:update_attributes => false))
        put :update, :id => "1"
        assigns(:install).should equal(mock_install)
      end

      it "should re-render the 'edit' template" do
        Install.stub!(:find).and_return(mock_install(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "responding to DELETE destroy" do

    it "should destroy the requested install" do
      Install.should_receive(:find).with("37").and_return(mock_install)
      mock_install.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "should redirect to the installs list" do
      Install.stub!(:find).and_return(mock_install(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(installs_url)
    end

  end

end
