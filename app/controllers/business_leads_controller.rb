class BusinessLeadsController < ApplicationController
  def index
  	@provinces = Province.all
 		@title = "Canada Lead Generation Service"
 		@descr = "LeadsMachine is a Canada-wide Lead Generation Service"
  end

  def show
  	@province = Province.find_by(abr: params[:id])
  	@largecities = @province.cities.large
  	@smallcities = @province.cities.small
  	@title = @province.name + " Lead Generation Service" 
  	@descr = "Get qualified leads for your business in " + @province.name
  end

end
