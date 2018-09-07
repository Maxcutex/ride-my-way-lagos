require "rails_helper"

RSpec.describe FollowersController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/rides/1/followers").to route_to(controller: "followers",
        action: "index",
        :ride_id => "1")
    end

    it "routes to #new" do
      expect(:get => "/rides/1/followers/new").to route_to("followers#new", :ride_id => "1")
    end

    it "routes to #show" do
      expect(:get => "/rides/1/followers/1").to route_to("followers#show", :ride_id => "1", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/rides/1/followers/1/edit").to route_to("followers#edit", :ride_id => "1", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/rides/1/followers").to route_to("followers#create", :ride_id => "1")
    end

    it "routes to #update via PUT" do
      expect(:put => "/rides/1/followers/1").to route_to("followers#update", :ride_id => "1", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/rides/1/followers/1").to route_to("followers#update", :ride_id => "1", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/rides/1/followers/1").to route_to("followers#destroy", :ride_id => "1", :id => "1")
    end
  end
end
