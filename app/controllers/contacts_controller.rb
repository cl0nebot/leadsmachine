class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])
    @contact.request = request
    if @contact.deliver
      flash.now[:notice] = 'Thank you for your message. We will contact you soon!'
    else
      redirect_to free_marketing_consultation_path, alert: "Something isn't correct. Please try again." and return false
    end
  rescue ScriptError
    flash[:error] = 'Sorry, this message appears to be spam and was not delivered.'
  end

end