require "administrate/base_dashboard"

class UserDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    charges: Field::HasMany,
    companies: Field::HasMany,
    machines: Field::HasMany,
    #properties: Field::HasMany,
    subscriptions: Field::HasMany,
    id: Field::Number,
    email: Field::String,
    encrypted_password: Field::String,
    reset_password_token: Field::String,
    reset_password_sent_at: Field::DateTime,
    remember_created_at: Field::DateTime,
    sign_in_count: Field::Number,
    current_sign_in_at: Field::DateTime,
    last_sign_in_at: Field::DateTime,
    current_sign_in_ip: Field::String,
    last_sign_in_ip: Field::String,
    confirmation_token: Field::String,
    confirmed_at: Field::DateTime,
    confirmation_sent_at: Field::DateTime,
    unconfirmed_email: Field::String,
    failed_attempts: Field::Number,
    unlock_token: Field::String,
    locked_at: Field::DateTime,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    role: Field::String.with_options(searchable: false),
    stripe_id: Field::String,
    card_last4: Field::String,
    card_exp_month: Field::Number,
    card_exp_year: Field::Number,
    card_type: Field::String,
  }

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :email,
    :charges,
    :companies,
    :machines,
   # :properties,
  ]

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    #:id,
    #:email,
    :role,
    :charges,
    :companies,
    :machines,
    #:properties,
    #:subscriptions,
    #:encrypted_password,
    #:reset_password_token,
    #:reset_password_sent_at,
    #:remember_created_at,
    :sign_in_count,
    :current_sign_in_at,
    :last_sign_in_at,
    #:current_sign_in_ip,
    #:last_sign_in_ip,
    #:confirmation_token,
    #:confirmed_at,
    #:confirmation_sent_at,
    #:unconfirmed_email,
    :failed_attempts,
    #:unlock_token,
    :locked_at,
    :created_at,
    :updated_at,
    
    :stripe_id,
    :card_last4,
    :card_exp_month,
    :card_exp_year,
    :card_type,
  ]

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    #:charges,
    #:companies,
    #:machines,
    #:properties,
    #:subscriptions,
    #:email,
    #:encrypted_password,
    #:reset_password_token,
    #:reset_password_sent_at,
    #:remember_created_at,
    #:sign_in_count,
    #:current_sign_in_at,
    #:last_sign_in_at,
    #:current_sign_in_ip,
    #:last_sign_in_ip,
    #:confirmation_token,
    #:confirmed_at,
    #:confirmation_sent_at,
    #:unconfirmed_email,
    #:failed_attempts,
    #:unlock_token,
    #:locked_at,
    :role,
    #:stripe_id,
    #:card_last4,
    #:card_exp_month,
    #:card_exp_year,
    #:card_type,
  ]

  # Overwrite this method to customize how users are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(user)
    "#{user.email}"
  end
end
