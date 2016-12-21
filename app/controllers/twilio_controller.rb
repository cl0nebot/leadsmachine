require 'twilio-ruby'
 
class TwilioController < ApplicationController
  include Webhookable
 
  after_filter :set_header
 
  skip_before_action :verify_authenticity_token
 
  def voice
    from = params[:From]
    to   = params[:To]
    
    tn = TrackingNumber.where(phone: to).first_or_create(phone: to, status: :unknown, provider: :twilio)

    if Blacklist.where(number: from).exists?

      response = Twilio::TwiML::Response.new do |r|
        r.Reject
      end
      render_twiml response
      MyLog.debug "Call Received!\t" + params[:CallSid]
      MyLog.debug "From:\t" + params[:From]
      MyLog.debug "To:\t" + params[:To]
      MyLog.debug "Blacklisted!\t" + Blacklist.find_by(number: params[:From]).description
      MyLog.debug "------------------"

    elsif tn.destination.nil?

      response = Twilio::TwiML::Response.new do |r|
        r.Say 'I don\'t know how to answer help you. Good Bye.'        
      end
      render_twiml response
      MyLog.debug "Call Received!\t" + params[:CallSid].to_s
      MyLog.debug "From:\t" + params[:From].to_s
      MyLog.debug "To:\t" + params[:To].to_s
      MyLog.debug "NOT FORWARDING - UNKNOWN NUMBER!!!\t" + tn.destination.to_s
      MyLog.debug "------------------"

    elsif tn.destination.nil?

      response = Twilio::TwiML::Response.new do |r|
        r.Say 'I don\'t know how to help you. Good Bye.'
      end
      render_twiml response
      MyLog.debug "Call Received!\t" + params[:CallSid].to_s
      MyLog.debug "From:\t" + params[:From].to_s
      MyLog.debug "To:\t" + params[:To].to_s
      MyLog.debug "NOT FORWARDING - UNKNOWN NUMBER!!!\t" + tn.destination.to_s
      MyLog.debug "------------------"

    else

      response = Twilio::TwiML::Response.new do |r|
        #r.Say 'Thank you.'
        r.Dial tn.destination, record: :true
      end
      render_twiml response

      @call = Call.create(
        tracking_number_id: tn.id,
        accountsid: params[:AccountSid].to_s,
        to:         params[:To].to_s,
        from:       params[:From].to_s,
        callsid:    params[:CallSid].to_s,
        direction:  params[:Direction].to_s,
        callercity: params[:CallerCity].to_s,
        callerstate: params[:CallerState].to_s,
        callercountry: params[:CallerCountry].to_s,
        callstatus: params[:CallStatus].to_s,
        calledcity: params[:CalledCity].to_s,
        lmstatus:   "incomplete"
        )
      MyLog.debug "Call Received!\t" + params[:CallSid].to_s
      MyLog.debug "From:\t" + params[:From].to_s
      MyLog.debug "To:\t" + params[:To].to_s
      MyLog.debug "Forwarding To:\t" + tn.destination.to_s
      MyLog.debug "------------------"
    end
  end

  def logger
    @call = Call.where(callsid: params[:CallSid]).first_or_create
    duration = params[:CallDuration]
    status = params[:CallStatus]
    if duration.to_i < 30
      lms = "short_call" 
    else
      lms = "unaudited"
    end
    @call.update(
      callstatus: status,
      callduration: duration,
      lmstatus: lms
      )
    response = Twilio::TwiML::Response.new do |r|
      r.Hangup
    end
    render_twiml response
  end

 
end