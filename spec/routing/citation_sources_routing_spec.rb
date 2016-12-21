require "rails_helper"

RSpec.describe CitationSourcesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/citation_sources").to route_to("citation_sources#index")
    end

    it "routes to #new" do
      expect(:get => "/citation_sources/new").to route_to("citation_sources#new")
    end

    it "routes to #show" do
      expect(:get => "/citation_sources/1").to route_to("citation_sources#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/citation_sources/1/edit").to route_to("citation_sources#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/citation_sources").to route_to("citation_sources#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/citation_sources/1").to route_to("citation_sources#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/citation_sources/1").to route_to("citation_sources#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/citation_sources/1").to route_to("citation_sources#destroy", :id => "1")
    end

  end
end
