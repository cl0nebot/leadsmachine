class CitiesController < ApplicationController
	before_action :authenticate_user!, except: [:show]

	def index
		@cities = City.all
		authorize! :index, @City
	end

  def show
		@city = City.friendly.find(params[:id])
		@title = "Business Leads in " + @city.name + ", " + @city.province.abr
		@descr = "Get qualified leads for your business in " + @city.name + ", " + @city.province.abr
  end
end
