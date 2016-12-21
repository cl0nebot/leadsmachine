class SubscriptionsController < ApplicationController
  before_action :authenticate_user!, except: [:new]
  before_action :redirect_to_signup, only: [:new]
  before_action :set_machine, only: [:show, :new]

  def new
    if @machine.nil?
      redirect_to machines_path, alert: "Sorry, this machine is no longer available" and return false
    end
    if @machine.user_id.nil?
      customer = if current_user.stripe_id?
                  Stripe::Customer.retrieve(current_user.stripe_id)
                 else
                  Stripe::Customer.create(email: current_user.email)
                 end
      
      customer.sources.total_count > 0 ? @hascard = true : @hascard = false

      @title = @machine.specialty.name + " leads in " + @machine.city.name + ", " + @machine.province.abr
      @age = (Time.now.to_i - Time.at(@machine.created_at.to_i).to_i) / 60 / 60 / 24


    elsif @machine.user_id == current_user.id
      redirect_to machines_path, notice: "You have already subscribed to this Machine" and return false
    else
      redirect_to machines_path, alert: "Sorry, this machine is no longer available" and return false
    end
  end

  def show
  end

  def create
    @machine.update!(machine: @machine, user_id: current_user.id)
    redirect_to machines_path
  end

  def wip

	  customer = if current_user.stripe_id?
                 Stripe::Customer.retrieve(current_user.stripe_id)
               else
                 Stripe::Customer.create(email: current_user.email)
               end

    subscription = customer.subscriptions.create(
      source: params[:stripeToken],
      plan: "monthly"
    )

    options = {
      stripe_id: customer.id,
      stripe_subscription_id: subscription.id,
    }

    # Only update the card on file if we're adding a new one
 

    redirect_to root_path
  end

  def destroy
    customer = Stripe::Customer.retrieve(current_user.stripe_id)
    customer.subscriptions.retrieve(current_user.stripe_subscription_id).delete
    current_user.update(stripe_subscription_id: nil)

    redirect_to root_path, notice: "Your subscription has been canceled."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_machine
    @machine = Machine.find_by_lmid(params[:lmid])
  end

  def redirect_to_signup
    if !user_signed_in?
      session["user_return_to"] = new_subscription_path
      redirect_to new_user_registration_path
    end
  end
end
