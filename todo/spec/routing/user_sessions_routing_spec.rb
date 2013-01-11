require "spec_helper"

describe UserSessionsController do
  describe "routing" do

    it "routes to #new" do
      get("/user_sessions/new").should route_to("user_sessions#new")
    end

    it "routes to #create" do
      post("/user_sessions").should route_to("user_sessions#create")
    end

    it "routes to #destroy" do
      delete("/user_sessions/1").should route_to("user_sessions#destroy", :id => "1")
    end

  end
end
