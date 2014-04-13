require "spec_helper"

describe UserItemsController do
  describe "routing" do

    it "routes to #index" do
      get("/user_items").should route_to("user_items#index")
    end

    it "routes to #new" do
      get("/user_items/new").should route_to("user_items#new")
    end

    it "routes to #show" do
      get("/user_items/1").should route_to("user_items#show", :id => "1")
    end

    it "routes to #edit" do
      get("/user_items/1/edit").should route_to("user_items#edit", :id => "1")
    end

    it "routes to #create" do
      post("/user_items").should route_to("user_items#create")
    end

    it "routes to #update" do
      put("/user_items/1").should route_to("user_items#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/user_items/1").should route_to("user_items#destroy", :id => "1")
    end

  end
end
