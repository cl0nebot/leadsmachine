require "administrate/base_dashboard"

class MachineDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    category: Field::BelongsTo,
    city: Field::BelongsTo,
    province: Field::BelongsTo,
    subcategory: Field::BelongsTo,
    specialty: Field::BelongsTo,
    user: Field::BelongsTo,
    properties: Field::HasMany,
    tracking_numbers: Field::HasMany,
    id: Field::Number,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    lmid: Field::Number,
    slug: Field::String,
    parent: Field::Number,
    retainer: Field::Number,
    retainercpl: Field::Number,
    leadguarantee: Field::Number,
    guaranteedate: Field::DateTime,
    cpl: Field::Number,
  }

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :lmid,
    :specialty,
    #:category,
    :city,
    #:province,
    #:subcategory,
  ]

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :specialty,
    :subcategory,
    :category,
    :city,
    :province,
    :user,
    :properties,
    :tracking_numbers,
    :id,
    :created_at,
    :updated_at,
    :lmid,
    :slug,
    :parent,
    :retainer,
    :retainercpl,
    :leadguarantee,
    :guaranteedate,
    :cpl,
  ]

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :category,
    :city,
    :province,
    :subcategory,
    :specialty,
    :user,
    :properties,
    :tracking_numbers,
    :lmid,
    :slug,
    :parent,
    :retainer,
    :retainercpl,
    :leadguarantee,
    :guaranteedate,
    :cpl,
  ]

  # Overwrite this method to customize how machines are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(machine)
    "M#{machine.lmid}"
  end
end
