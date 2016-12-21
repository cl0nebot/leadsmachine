class UpdateStripePlanJob < ActiveJob::Base
  queue_as :default

  def perform(id)
    lm  = Machine.find_by_lmid(id)
    begin
      plan = Stripe::Plan.retrieve(lm.slug)
    rescue => e
    end

    if plan.nil?
    	#whoops! no plan here. create one.
    	CreateStripePlanJob.perform_later lm.id
    else
    	descr = "L-MACHINE " + lm.slug
      dirty = false

    	dirty = true unless (
        (lm.retainer == plan.amount) &&
        (plan.interval == "month") &&
        (plan.statement_descriptor == descr) &&
        (plan.name == plan.id)
        )

    	if dirty == true
        plan.delete
        # TODO: Resubscribe customer to plan
        CreateStripePlanJob.perform_later lm.id 
    	end
    end
    # https://support.stripe.com/questions/change-plan-price
  end
end


