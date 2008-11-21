require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ReposController do

  def mock_repo(stubs={})
    @mock_repo ||= mock_model(Repo, stubs)
  end
  
  describe "responding to GET index" do

    it "should expose all repos as @repos" do
      Repo.should_receive(:find).with(:all).and_return([mock_repo])
      get :index
      assigns[:repos].should == [mock_repo]
    end

    describe "with mime type of xml" do
  
      it "should render all repos as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Repo.should_receive(:find).with(:all).and_return(repos = mock("Array of Repos"))
        repos.should_receive(:to_xml).and_return("generated XML")
        get :index
        response.body.should == "generated XML"
      end
    
    end

  end

  describe "responding to GET show" do

    it "should expose the requested repo as @repo" do
      Repo.should_receive(:find).with("37").and_return(mock_repo)
      get :show, :id => "37"
      assigns[:repo].should equal(mock_repo)
    end
    
    describe "with mime type of xml" do

      it "should render the requested repo as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Repo.should_receive(:find).with("37").and_return(mock_repo)
        mock_repo.should_receive(:to_xml).and_return("generated XML")
        get :show, :id => "37"
        response.body.should == "generated XML"
      end

    end
    
  end

  describe "responding to GET new" do
  
    it "should expose a new repo as @repo" do
      Repo.should_receive(:new).and_return(mock_repo)
      get :new
      assigns[:repo].should equal(mock_repo)
    end

  end

  describe "responding to GET edit" do
  
    it "should expose the requested repo as @repo" do
      Repo.should_receive(:find).with("37").and_return(mock_repo)
      get :edit, :id => "37"
      assigns[:repo].should equal(mock_repo)
    end

  end

  describe "responding to POST create" do

    describe "with valid params" do
      
      it "should expose a newly created repo as @repo" do
        Repo.should_receive(:new).with({'these' => 'params'}).and_return(mock_repo(:save => true))
        post :create, :repo => {:these => 'params'}
        assigns(:repo).should equal(mock_repo)
      end

      it "should redirect to the created repo" do
        Repo.stub!(:new).and_return(mock_repo(:save => true))
        post :create, :repo => {}
        response.should redirect_to(repo_url(mock_repo))
      end
      
    end
    
    describe "with invalid params" do

      it "should expose a newly created but unsaved repo as @repo" do
        Repo.stub!(:new).with({'these' => 'params'}).and_return(mock_repo(:save => false))
        post :create, :repo => {:these => 'params'}
        assigns(:repo).should equal(mock_repo)
      end

      it "should re-render the 'new' template" do
        Repo.stub!(:new).and_return(mock_repo(:save => false))
        post :create, :repo => {}
        response.should render_template('new')
      end
      
    end
    
  end

  describe "responding to PUT udpate" do

    describe "with valid params" do

      it "should update the requested repo" do
        Repo.should_receive(:find).with("37").and_return(mock_repo)
        mock_repo.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :repo => {:these => 'params'}
      end

      it "should expose the requested repo as @repo" do
        Repo.stub!(:find).and_return(mock_repo(:update_attributes => true))
        put :update, :id => "1"
        assigns(:repo).should equal(mock_repo)
      end

      it "should redirect to the repo" do
        Repo.stub!(:find).and_return(mock_repo(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(repo_url(mock_repo))
      end

    end
    
    describe "with invalid params" do

      it "should update the requested repo" do
        Repo.should_receive(:find).with("37").and_return(mock_repo)
        mock_repo.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :repo => {:these => 'params'}
      end

      it "should expose the repo as @repo" do
        Repo.stub!(:find).and_return(mock_repo(:update_attributes => false))
        put :update, :id => "1"
        assigns(:repo).should equal(mock_repo)
      end

      it "should re-render the 'edit' template" do
        Repo.stub!(:find).and_return(mock_repo(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "responding to DELETE destroy" do

    it "should destroy the requested repo" do
      Repo.should_receive(:find).with("37").and_return(mock_repo)
      mock_repo.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "should redirect to the repos list" do
      Repo.stub!(:find).and_return(mock_repo(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(repos_url)
    end

  end

end
