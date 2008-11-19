require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe InstallsController do
  describe "route generation" do
    it "should map #index" do
      route_for(:controller => "installs", :action => "index").should == "/installs"
    end
  
    it "should map #new" do
      route_for(:controller => "installs", :action => "new").should == "/installs/new"
    end
  
    it "should map #show" do
      route_for(:controller => "installs", :action => "show", :id => 1).should == "/installs/1"
    end
  
    it "should map #edit" do
      route_for(:controller => "installs", :action => "edit", :id => 1).should == "/installs/1/edit"
    end
  
    it "should map #update" do
      route_for(:controller => "installs", :action => "update", :id => 1).should == "/installs/1"
    end
  
    it "should map #destroy" do
      route_for(:controller => "installs", :action => "destroy", :id => 1).should == "/installs/1"
    end
  end

  describe "route recognition" do
    it "should generate params for #index" do
      params_from(:get, "/installs").should == {:controller => "installs", :action => "index"}
    end
  
    it "should generate params for #new" do
      params_from(:get, "/installs/new").should == {:controller => "installs", :action => "new"}
    end
  
    it "should generate params for #create" do
      params_from(:post, "/installs").should == {:controller => "installs", :action => "create"}
    end
  
    it "should generate params for #show" do
      params_from(:get, "/installs/1").should == {:controller => "installs", :action => "show", :id => "1"}
    end
  
    it "should generate params for #edit" do
      params_from(:get, "/installs/1/edit").should == {:controller => "installs", :action => "edit", :id => "1"}
    end
  
    it "should generate params for #update" do
      params_from(:put, "/installs/1").should == {:controller => "installs", :action => "update", :id => "1"}
    end
  
    it "should generate params for #destroy" do
      params_from(:delete, "/installs/1").should == {:controller => "installs", :action => "destroy", :id => "1"}
    end
  end
end
