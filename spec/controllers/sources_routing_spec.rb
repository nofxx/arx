require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe SourcesController do
  describe "route generation" do
    it "should map #index" do
      route_for(:controller => "sources", :action => "index").should == "/sources"
    end
  
    it "should map #new" do
      route_for(:controller => "sources", :action => "new").should == "/sources/new"
    end
  
    it "should map #show" do
      route_for(:controller => "sources", :action => "show", :id => 1).should == "/sources/1"
    end
  
    it "should map #edit" do
      route_for(:controller => "sources", :action => "edit", :id => 1).should == "/sources/1/edit"
    end
  
    it "should map #update" do
      route_for(:controller => "sources", :action => "update", :id => 1).should == "/sources/1"
    end
  
    it "should map #destroy" do
      route_for(:controller => "sources", :action => "destroy", :id => 1).should == "/sources/1"
    end
  end

  describe "route recognition" do
    it "should generate params for #index" do
      params_from(:get, "/sources").should == {:controller => "sources", :action => "index"}
    end
  
    it "should generate params for #new" do
      params_from(:get, "/sources/new").should == {:controller => "sources", :action => "new"}
    end
  
    it "should generate params for #create" do
      params_from(:post, "/sources").should == {:controller => "sources", :action => "create"}
    end
  
    it "should generate params for #show" do
      params_from(:get, "/sources/1").should == {:controller => "sources", :action => "show", :id => "1"}
    end
  
    it "should generate params for #edit" do
      params_from(:get, "/sources/1/edit").should == {:controller => "sources", :action => "edit", :id => "1"}
    end
  
    it "should generate params for #update" do
      params_from(:put, "/sources/1").should == {:controller => "sources", :action => "update", :id => "1"}
    end
  
    it "should generate params for #destroy" do
      params_from(:delete, "/sources/1").should == {:controller => "sources", :action => "destroy", :id => "1"}
    end
  end
end
