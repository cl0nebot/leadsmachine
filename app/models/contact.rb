class Contact < MailForm::Base
  attribute :name,      :validate => true
  attribute :company,   :validate => true
  attribute :biztype,      :validate => true
  attribute :email,     :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :nickname,  :captcha  => true
  attribute :phone
  attribute :market
  
  # Declare the e-mail headers. It accepts anything the mail method
  # in ActionMailer accepts.
  def headers
    {
      :subject => "LeadsMachine Contact Form",
      :to => "me@roberthof.com",
      :from => %("#{name}" <#{email}>)
    }
  end
end