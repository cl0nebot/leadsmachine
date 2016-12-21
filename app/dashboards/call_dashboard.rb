require "administrate/base_dashboard"

class CallDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    tracking_number: Field::BelongsTo,
    id: Field::Number,
    accountsid: Field::String,
    to: Field::String,
    from: Field::String,
    callsid: Field::String,
    callduration: Field::String,
    direction: Field::String,
    lmstatus: Field::Number,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    callercity: Field::String,
    callerstate: Field::String,
    callercountry: Field::String,
    callstatus: Field::String,
    calledcity: Field::String,
  }

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :from,
    :callercity,
    :callerstate,
    :callduration,
  ]

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :tracking_number,
    :id,
    :accountsid,
    :to,
    :from,
    :callsid,
    :callduration,
    :direction,
    :lmstatus,
    :created_at,
    :updated_at,
    :callercity,
    :callerstate,
    :callercountry,
    :callstatus,
    :calledcity,
  ]

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :tracking_number,
    :accountsid,
    :to,
    :from,
    :callsid,
    :callduration,
    :direction,
    :lmstatus,
    :callercity,
    :callerstate,
    :callercountry,
    :callstatus,
    :calledcity,
  ]

  # Overwrite this method to customize how calls are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(call)
  #   "Call ##{call.id}"
  # end
end
