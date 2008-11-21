require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ReposController do
  describe "route generation" do
    it "should map #index" do
      route_for(:controller => "repos", :action => "index").should == "/repos"
    end
  
    it "should map #new" do
      route_for(:controller => "repos", :action => "new").should == "/repos/new"
    end
  
    it "should map #show" do
      route_for(:controller => "repos", :action => "show", :id => 1).should == "/repos/1"
    end
  
    it "should map #edit" do
      route_for(:controller => "repos", :action => "edit", :id => 1).should == "/repos/1/edit"
    end
  
    it "should map #update" do
      route_for(:controller => "repos", :action => "update", :id => 1).should == "/repos/1"
    end
  
    it "should map #destroy" do
      route_for(:controller => "repos", :action => "destroy", :id => 1).should == "/repos/1"
    end
  end

  describe "route recognition" do
    it "should generate params for #index" do
      params_from(:get, "/repos").should == {:controller => "repos", :action => "index"}
    end
  
    it "should generate params for #new" do
      params_from(:get, "/repos/new").should == {:controller => "repos", :action => "new"}
    end
  
    it "should generate params for #create" do
      params_from(:post, "/repos").should == {:controller => "repos", :action => "create"}
    end
  
    it "should generate params for #show" do
      params_from(:get, "/repos/1").should == {:controller => "repos", :action => "show", :id => "1"}
    end
  
    it "should generate params for #edit" do
      params_from(:get, "/repos/1/edit").should == {:controller => "repos", :action => "edit", :id => "1"}
    end
  
    it "should generate params for #update" do
      params_from(:put, "/repos/1").should == {:controller => "repos", :action => "update", :id => "1"}
    end
  
    it "should generate params for #destroy" do
      params_from(:delete, "/repos/1").should == {:controller => "repos", :action => "destroy", :id => "1"}
    end
  end
end
