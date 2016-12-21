require 'rails_helper'

RSpec.describe "companies/show", type: :view do
  before(:each) do
    @company = assign(:company, Company.create!(
      :user => nil,
      :cname => "Cname",
      :street1 => "Street1",
      :street2 => "Street2",
      :city => "City",
      :province => nil,
      :postalcode => "Postalcode",
      :phone => "Phone",
      :googleplus => "Googleplus",
      :facebook => "Facebook",
      :linkedin => "Linkedin",
      :twitter => "Twitter",
      :shortdescription => "Shortdescription",
      :longdescription => "Longdescription",
      :tags => "Tags",
      :citationemail => "Citationemail",
      :businessemail => "Businessemail",
      :login => "Login",
      :password => "Password",
      :timezone => "Timezone"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Cname/)
    expect(rendered).to match(/Street1/)
    expect(rendered).to match(/Street2/)
    expect(rendered).to match(/City/)
    expect(rendered).to match(//)
    expect(rendered).to match(/Postalcode/)
    expect(rendered).to match(/Phone/)
    expect(rendered).to match(/Googleplus/)
    expect(rendered).to match(/Facebook/)
    expect(rendered).to match(/Linkedin/)
    expect(rendered).to match(/Twitter/)
    expect(rendered).to match(/Shortdescription/)
    expect(rendered).to match(/Longdescription/)
    expect(rendered).to match(/Tags/)
    expect(rendered).to match(/Citationemail/)
    expect(rendered).to match(/Businessemail/)
    expect(rendered).to match(/Login/)
    expect(rendered).to match(/Password/)
    expect(rendered).to match(/Timezone/)
  end
end
