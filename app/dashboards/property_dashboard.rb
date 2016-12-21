require "administrate/base_dashboard"

class PropertyDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    #prop: Field::Polymorphic,
    citations: Field::HasMany,
    id: Field::Number,
    name: Field::String,
    street1: Field::String,
    street2: Field::String,
    city: Field::String,
    province: Field::String,
    postalcode: Field::String,
    phone: Field::String,
    googleplus: Field::String,
    facebook: Field::String,
    linkedin: Field::String,
    twitter: Field::String,
    shortdescription: Field::String,
    longdescription: Field::Text,
    tags: Field::String,
    url: Field::String,
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
    :name,
    :url,
    :citations,
    :id,
  ]

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :url,
    #:prop,
    :citations,
    :name,
    :street1,
    :street2,
    :city,
    :province,
    :postalcode,
    :phone,
    :googleplus,
    :facebook,
    :linkedin,
    :twitter,
    :shortdescription,
    :longdescription,
    :tags,
    
    :citationemail,
    :businessemail,
    :login,
    :password,
    :timezone,
  ]

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :url,
    #:prop,
    :citations,
    :name,
    :street1,
    :street2,
    :city,
    :province,
    :postalcode,
    :phone,
    :googleplus,
    :facebook,
    :linkedin,
    :twitter,
    :shortdescription,
    :longdescription,
    :tags,
    :citationemail,
    :businessemail,
    :login,
    :password,
    :timezone,
  ]

  # Overwrite this method to customize how properties are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(property)
    "#{property.name} (P)"
  end
end
