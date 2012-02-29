require "spec_helper"

describe GroupCategoriesController do
  describe "routing" do

    it "routes to #index" do
      get("/group_categories").should route_to("group_categories#index")
    end

    it "routes to #new" do
      get("/group_categories/new").should route_to("group_categories#new")
    end

    it "routes to #show" do
      get("/group_categories/1").should route_to("group_categories#show", :id => "1")
    end

    it "routes to #edit" do
      get("/group_categories/1/edit").should route_to("group_categories#edit", :id => "1")
    end

    it "routes to #create" do
      post("/group_categories").should route_to("group_categories#create")
    end

    it "routes to #update" do
      put("/group_categories/1").should route_to("group_categories#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/group_categories/1").should route_to("group_categories#destroy", :id => "1")
    end

  end
end
