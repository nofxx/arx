require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe VersionsController do
  describe "route generation" do
    it "should map #index" do
      route_for(:controller => "versions", :action => "index").should == "/versions"
    end
  
    it "should map #new" do
      route_for(:controller => "versions", :action => "new").should == "/versions/new"
    end
  
    it "should map #show" do
      route_for(:controller => "versions", :action => "show", :id => 1).should == "/versions/1"
    end
  
    it "should map #edit" do
      route_for(:controller => "versions", :action => "edit", :id => 1).should == "/versions/1/edit"
    end
  
    it "should map #update" do
      route_for(:controller => "versions", :action => "update", :id => 1).should == "/versions/1"
    end
  
    it "should map #destroy" do
      route_for(:controller => "versions", :action => "destroy", :id => 1).should == "/versions/1"
    end
  end

  describe "route recognition" do
    it "should generate params for #index" do
      params_from(:get, "/versions").should == {:controller => "versions", :action => "index"}
    end
  
    it "should generate params for #new" do
      params_from(:get, "/versions/new").should == {:controller => "versions", :action => "new"}
    end
  
    it "should generate params for #create" do
      params_from(:post, "/versions").should == {:controller => "versions", :action => "create"}
    end
  
    it "should generate params for #show" do
      params_from(:get, "/versions/1").should == {:controller => "versions", :action => "show", :id => "1"}
    end
  
    it "should generate params for #edit" do
      params_from(:get, "/versions/1/edit").should == {:controller => "versions", :action => "edit", :id => "1"}
    end
  
    it "should generate params for #update" do
      params_from(:put, "/versions/1").should == {:controller => "versions", :action => "update", :id => "1"}
    end
  
    it "should generate params for #destroy" do
      params_from(:delete, "/versions/1").should == {:controller => "versions", :action => "destroy", :id => "1"}
    end
  end
end
