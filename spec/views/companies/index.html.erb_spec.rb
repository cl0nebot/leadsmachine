require 'rails_helper'

RSpec.describe "companies/index", type: :view do
  before(:each) do
    assign(:companies, [
      Company.create!(
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
      ),
      Company.create!(
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
      )
    ])
  end

  it "renders a list of companies" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Cname".to_s, :count => 2
    assert_select "tr>td", :text => "Street1".to_s, :count => 2
    assert_select "tr>td", :text => "Street2".to_s, :count => 2
    assert_select "tr>td", :text => "City".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Postalcode".to_s, :count => 2
    assert_select "tr>td", :text => "Phone".to_s, :count => 2
    assert_select "tr>td", :text => "Googleplus".to_s, :count => 2
    assert_select "tr>td", :text => "Facebook".to_s, :count => 2
    assert_select "tr>td", :text => "Linkedin".to_s, :count => 2
    assert_select "tr>td", :text => "Twitter".to_s, :count => 2
    assert_select "tr>td", :text => "Shortdescription".to_s, :count => 2
    assert_select "tr>td", :text => "Longdescription".to_s, :count => 2
    assert_select "tr>td", :text => "Tags".to_s, :count => 2
    assert_select "tr>td", :text => "Citationemail".to_s, :count => 2
    assert_select "tr>td", :text => "Businessemail".to_s, :count => 2
    assert_select "tr>td", :text => "Login".to_s, :count => 2
    assert_select "tr>td", :text => "Password".to_s, :count => 2
    assert_select "tr>td", :text => "Timezone".to_s, :count => 2
  end
end
