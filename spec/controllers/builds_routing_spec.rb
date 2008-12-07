require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe BuildsController do
  describe "route generation" do
    it "should map #index" do
      route_for(:controller => "builds", :action => "index").should == "/builds"
    end

    it "should map #new" do
      route_for(:controller => "builds", :action => "new").should == "/builds/new"
    end

    it "should map #show" do
      route_for(:controller => "builds", :action => "show", :id => 1).should == "/builds/1"
    end

    it "should map #edit" do
      route_for(:controller => "builds", :action => "edit", :id => 1).should == "/builds/1/edit"
    end

    it "should map #update" do
      route_for(:controller => "builds", :action => "update", :id => 1).should == "/builds/1"
    end

    it "should map #destroy" do
      route_for(:controller => "builds", :action => "destroy", :id => 1).should == "/builds/1"
    end
  end

  describe "route recognition" do
    it "should generate params for #index" do
      params_from(:get, "/builds").should == {:controller => "builds", :action => "index"}
    end

    it "should generate params for #new" do
      params_from(:get, "/builds/new").should == {:controller => "builds", :action => "new"}
    end

    it "should generate params for #create" do
      params_from(:post, "/builds").should == {:controller => "builds", :action => "create"}
    end

    it "should generate params for #show" do
      params_from(:get, "/builds/1").should == {:controller => "builds", :action => "show", :id => "1"}
    end

    it "should generate params for #edit" do
      params_from(:get, "/builds/1/edit").should == {:controller => "builds", :action => "edit", :id => "1"}
    end

    it "should generate params for #update" do
      params_from(:put, "/builds/1").should == {:controller => "builds", :action => "update", :id => "1"}
    end

    it "should generate params for #destroy" do
      params_from(:delete, "/builds/1").should == {:controller => "builds", :action => "destroy", :id => "1"}
    end
  end
end
