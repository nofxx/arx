require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe KarmasController do

  def mock_karma(stubs={})
    @mock_karma ||= mock_model(Karma, stubs)
  end
  
  describe "responding to GET index" do

    it "should expose all karmas as @karmas" do
      Karma.should_receive(:find).with(:all).and_return([mock_karma])
      get :index
      assigns[:karmas].should == [mock_karma]
    end

    describe "with mime type of xml" do
  
      it "should render all karmas as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Karma.should_receive(:find).with(:all).and_return(karmas = mock("Array of Karmas"))
        karmas.should_receive(:to_xml).and_return("generated XML")
        get :index
        response.body.should == "generated XML"
      end
    
    end

  end

  describe "responding to GET show" do

    it "should expose the requested karma as @karma" do
      Karma.should_receive(:find).with("37").and_return(mock_karma)
      get :show, :id => "37"
      assigns[:karma].should equal(mock_karma)
    end
    
    describe "with mime type of xml" do

      it "should render the requested karma as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Karma.should_receive(:find).with("37").and_return(mock_karma)
        mock_karma.should_receive(:to_xml).and_return("generated XML")
        get :show, :id => "37"
        response.body.should == "generated XML"
      end

    end
    
  end

  describe "responding to GET new" do
  
    it "should expose a new karma as @karma" do
      Karma.should_receive(:new).and_return(mock_karma)
      get :new
      assigns[:karma].should equal(mock_karma)
    end

  end

  describe "responding to GET edit" do
  
    it "should expose the requested karma as @karma" do
      Karma.should_receive(:find).with("37").and_return(mock_karma)
      get :edit, :id => "37"
      assigns[:karma].should equal(mock_karma)
    end

  end

  describe "responding to POST create" do

    describe "with valid params" do
      
      it "should expose a newly created karma as @karma" do
        Karma.should_receive(:new).with({'these' => 'params'}).and_return(mock_karma(:save => true))
        post :create, :karma => {:these => 'params'}
        assigns(:karma).should equal(mock_karma)
      end

      it "should redirect to the created karma" do
        Karma.stub!(:new).and_return(mock_karma(:save => true))
        post :create, :karma => {}
        response.should redirect_to(karma_url(mock_karma))
      end
      
    end
    
    describe "with invalid params" do

      it "should expose a newly created but unsaved karma as @karma" do
        Karma.stub!(:new).with({'these' => 'params'}).and_return(mock_karma(:save => false))
        post :create, :karma => {:these => 'params'}
        assigns(:karma).should equal(mock_karma)
      end

      it "should re-render the 'new' template" do
        Karma.stub!(:new).and_return(mock_karma(:save => false))
        post :create, :karma => {}
        response.should render_template('new')
      end
      
    end
    
  end

  describe "responding to PUT udpate" do

    describe "with valid params" do

      it "should update the requested karma" do
        Karma.should_receive(:find).with("37").and_return(mock_karma)
        mock_karma.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :karma => {:these => 'params'}
      end

      it "should expose the requested karma as @karma" do
        Karma.stub!(:find).and_return(mock_karma(:update_attributes => true))
        put :update, :id => "1"
        assigns(:karma).should equal(mock_karma)
      end

      it "should redirect to the karma" do
        Karma.stub!(:find).and_return(mock_karma(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(karma_url(mock_karma))
      end

    end
    
    describe "with invalid params" do

      it "should update the requested karma" do
        Karma.should_receive(:find).with("37").and_return(mock_karma)
        mock_karma.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :karma => {:these => 'params'}
      end

      it "should expose the karma as @karma" do
        Karma.stub!(:find).and_return(mock_karma(:update_attributes => false))
        put :update, :id => "1"
        assigns(:karma).should equal(mock_karma)
      end

      it "should re-render the 'edit' template" do
        Karma.stub!(:find).and_return(mock_karma(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "responding to DELETE destroy" do

    it "should destroy the requested karma" do
      Karma.should_receive(:find).with("37").and_return(mock_karma)
      mock_karma.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "should redirect to the karmas list" do
      Karma.stub!(:find).and_return(mock_karma(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(karmas_url)
    end

  end

end
