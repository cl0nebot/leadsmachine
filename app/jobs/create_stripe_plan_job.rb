class CreateStripePlanJob < ActiveJob::Base
  queue_as :default

  def perform(id)
    lm = Machine.find(id)
    descr = "L-MACHINE " + lm.slug
    
    plan = Stripe::Plan.create(
    	id: lm.slug,
    	amount: lm.retainer,
    	currency: 'cad',
    	interval: 'month',
    	name: lm.slug,
    	statement_descriptor: descr
    	)
  end
end
