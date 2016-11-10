require "rails_helper"

RSpec.describe StartController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/start").to route_to("start#index")
    end

    it "routes to #import" do
      expect(:post => "/start/import").to route_to("start#import")
    end

  end
end
