require 'twilio-ruby'
		
class TwillioLoggerJob < ActiveJob::Base
  queue_as :default

  def perform(*args)
		account_sid = 'AC0e7058be8952da895ec3dead5a172b46'
		auth_token = 'b7415aea464b8b93e3420b9d398787c7'
		@client = Twilio::REST::Client.new account_sid, auth_token


		# Get Calls for the last 15 minutes


		# Loop over calls and print out a property for each one
#		@client.account.calls.list({
#		    status: "completed",
#		    :"start_time>" => "2015-07-06"}).each do |call|
		    #puts "----"
		    #puts call.sid 
#	    end

@call = @client.account.calls.get("CA51bf954cd578017d969389bfeb0e1881")
puts @call.sid
puts @call.to
puts @call.uri

#TrackingNumber.where(phone: Call.last.to.last(10)).first


#		    t = Call.where(sid: call.sid).first_or_create(
		    	                #sid: call.sid,
		    	                #to: call.to,
		    	                #from: call.from,
		    	                #duration: call.duration,
		    	                #direction: call.direction,

		    	                #phonenumbersid: call.PhoneNumberSid,
		    	                #parentcallsid: call.parentcallsid,
													#datecreated: call.datecreated,
													#dateupdated: call.dateupdated,
							            #accountsid: call.accountsid,
                    
                  
#        :phonenumbersid => :string,
#        :providerstatus => :string,
#             :starttime => :string,
#               :endtime => :string,
##              :duration => :string,
#                 :price => :string,
#             :priceunit => :string,

#            :answeredby => :string,
#         :forwardedfrom => :string,
#            :callername => :string,
#                   :uri => :string,
 #             :lmstatus => :integer,

#				)
#		    puts "Our ID: " + t.id.to_s
		
  end
end
