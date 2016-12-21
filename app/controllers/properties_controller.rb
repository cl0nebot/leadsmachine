class PropertiesController < ApplicationController
  before_action :set_property, only: [:edit, :show, :update]
  before_action :authenticate_user!
  #TODO: Authenticate Properties

  #before_filter :authorize_parent

  #load_resource :user
  #load_resource :machine
  #load_resource :property, through: [ :user, :machine ]

  def new
    @ref = Rails.application.routes.recognize_path(request.referrer)
    @property = Property.new
  end

  def create
   @property = Property.new(property_params)

    respond_to do |format|
      if @property.save
        format.html { redirect_to @property, notice: 'Property was successfully created.' }
        format.json { render :show, status: :created, location: @property }
      else
        format.html { render :new }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @ref = Rails.application.routes.recognize_path(request.referrer)
  end

  def create
   @property = Property.new(property_params)

    respond_to do |format|
      if @property.save
        format.html { redirect_to @property, notice: 'Property was successfully created.' }
        format.json { render :show, status: :created, location: @property }
      else
        format.html { render :new }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @property.update(property_params)
        format.html { redirect_to @property, notice: 'Property was successfully updated.' }
        format.json { render :show, status: :ok, location: @property }
      else
        format.html { render :edit }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end

  def index
    if params[:client_id]
      @client = User.find_by_id(params[:client_id])
      @properties = @client.properties
    else
      redirect_to :back
    end
  end

	def show
	end

  private
  def authorize_parent
    authorize! :read, (@machine || @user)
  end

  def set_property
    @property = Property.find_by_id(params[:id])
  end

  def property_params
    params.require(:property).permit(:name, :url, :street1, :street2, :city, :province, :postalcode, :phone, :googleplus, :facebook, :linkedin, :twitter, :machine_id)
  end
end
