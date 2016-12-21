require "administrate/base_dashboard"

class CompanyDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    user: Field::BelongsTo,
    province: Field::BelongsTo,
    id: Field::Number,
    cname: Field::String,
    street1: Field::String,
    street2: Field::String,
    city: Field::String,
    postalcode: Field::String,
    phone: Field::String,
    googleplus: Field::String,
    facebook: Field::String,
    linkedin: Field::String,
    twitter: Field::String,
    shortdescription: Field::String,
    longdescription: Field::String,
    tags: Field::String,
    citationemail: Field::String,
    businessemail: Field::String,
    login: Field::String,
    password: Field::String,
    timezone: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :cname,
    :city,
    :user,
    :province,
    :id,
   
  ]

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :cname,
    :street1,
    :street2,
    :city,
    :province,
    :postalcode,
    :phone,
    :user,
  ]

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :cname,
    :street1,
    :street2,
    :city,
    :province,
    :postalcode,
    :phone,
    :user,

  ]

  # Overwrite this method to customize how companies are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(company)
    "#{company.cname}"
  end
end
