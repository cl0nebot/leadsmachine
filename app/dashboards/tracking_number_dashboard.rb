require "administrate/base_dashboard"

class TrackingNumberDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    machine: Field::BelongsTo,
    calls: Field::HasMany,
    id: Field::Number,
    phone: Field::String,
    status: Field::String.with_options(searchable: false),
    provider: Field::String.with_options(searchable: false),
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    destination: Field::String,
  }

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :phone,
    :destination,
    :machine,
    :calls,
  ]

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :machine,
    :calls,
    :id,
    :phone,
    :status,
    :provider,
    :created_at,
    :updated_at,
    :destination,
  ]

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :machine,
    :phone,
    :destination,
    #:status,
    #:provider,
    
  ]

  # Overwrite this method to customize how tracking numbers are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(tracking_number)
    "#{tracking_number.phone}"
  end
end
