#require 'faraday'

class TwillioLoggerJob < ActiveJob::Base
  queue_as :default

  def perform(*args)
		account_sid = 'AC0e7058be8952da895ec3dead5a172b46'
		auth_token = 'b7415aea464b8b93e3420b9d398787c7'

auth = {:username => account_sid, :password => auth_token}
@blah = HTTParty.get("http://twitter.com/statuses/public_timeline.json", 
                     :basic_auth => auth)

#		conn = Faraday.new(url: 'http://api.twilio.com/2010-04-01/Accounts/') do |faraday|
#   		faraday.response :logger
#   		faraday.basic_auth('AC0e7058be8952da895ec3dead5a172b46','b7415aea464b8b93e3420b9d398787c7')
#   		faraday.adapter  Faraday.default_adapter
# 		end

		response = conn.get 'AC0e7058be8952da895ec3dead5a172b46/Calls/CA51bf954cd578017d969389bfeb0e1881'
		puts response.body


	end
end


