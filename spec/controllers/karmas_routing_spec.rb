require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe KarmasController do
  describe "route generation" do
    it "should map #index" do
      route_for(:controller => "karmas", :action => "index").should == "/karmas"
    end
  
    it "should map #new" do
      route_for(:controller => "karmas", :action => "new").should == "/karmas/new"
    end
  
    it "should map #show" do
      route_for(:controller => "karmas", :action => "show", :id => 1).should == "/karmas/1"
    end
  
    it "should map #edit" do
      route_for(:controller => "karmas", :action => "edit", :id => 1).should == "/karmas/1/edit"
    end
  
    it "should map #update" do
      route_for(:controller => "karmas", :action => "update", :id => 1).should == "/karmas/1"
    end
  
    it "should map #destroy" do
      route_for(:controller => "karmas", :action => "destroy", :id => 1).should == "/karmas/1"
    end
  end

  describe "route recognition" do
    it "should generate params for #index" do
      params_from(:get, "/karmas").should == {:controller => "karmas", :action => "index"}
    end
  
    it "should generate params for #new" do
      params_from(:get, "/karmas/new").should == {:controller => "karmas", :action => "new"}
    end
  
    it "should generate params for #create" do
      params_from(:post, "/karmas").should == {:controller => "karmas", :action => "create"}
    end
  
    it "should generate params for #show" do
      params_from(:get, "/karmas/1").should == {:controller => "karmas", :action => "show", :id => "1"}
    end
  
    it "should generate params for #edit" do
      params_from(:get, "/karmas/1/edit").should == {:controller => "karmas", :action => "edit", :id => "1"}
    end
  
    it "should generate params for #update" do
      params_from(:put, "/karmas/1").should == {:controller => "karmas", :action => "update", :id => "1"}
    end
  
    it "should generate params for #destroy" do
      params_from(:delete, "/karmas/1").should == {:controller => "karmas", :action => "destroy", :id => "1"}
    end
  end
end
