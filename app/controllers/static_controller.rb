class StaticController < ApplicationController
  before_action :set_provinces, except: [:bye]
  before_action :set_contact, only: [:freeconsult, :contact]
  before_action :authenticate_user!, only: [:dashboard, :clients]

  def bye
    render layout: "layouts/redirect2home"
  end

  def contact
    @title = "Contact LeadsMachine for Lead Generation"
    @desc = @title
  end

  def clients
    if current_user.client?
      redirect_to machines_path and return false
    else
      @clients = User.client.all
    end
  end

  def dashboard
    if (current_user.admin? or current_user.staff? )
      @callstoday = Call.where(updated_at: (Time.now - 24.hours)..Time.now).count
      @callsthismonth = Call.where(updated_at: Date.today.all_month).count
      @callslastmonth = Call.where(updated_at: Date.today.last_month).count

      @prospects = User.client.includes(:machines).where( :machines => { :user_id => nil } )
      @clientcount = User.client.count
      @retainertotal = Machine.sum(:retainer).to_f / 100 if Machine.exists?


      @machines = Machine.sold.all
    else
      @machines = current_user.machines
    end

    #@properties = current_user.properties
  end

  def freeconsult
    @title = "One Hour to better online marketing"
    @desc = @title
  end

  def home
    render layout: "layouts/nogrid"
    @title = "Lead Generation for Canadian Businesses - LeadsMachine"
    @desc = @title
  end
  
  def privacy
  	render layout: "layouts/nogrid"
    @title = "LeadsMachine Privacy Policy"
    @desc = @title
  end

  def refunds
  	render layout: "layouts/nogrid"
    @title = "LeadsMachine Refund Policy"
    @desc = @title
  end

  def tos
  	render layout: "layouts/nogrid"
    @title = "LeadsMachine Terms of Service"
    @desc = @title
  end

	private
    # Use callbacks to share common setup or constraints between actions.
    def set_provinces
      @provinces = Province.all
    end

    def set_contact
      @contact = Contact.new
    end


end
