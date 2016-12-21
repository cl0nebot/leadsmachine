require 'rails_helper'

RSpec.describe "companies/edit", type: :view do
  before(:each) do
    @company = assign(:company, Company.create!(
      :user => nil,
      :cname => "MyString",
      :street1 => "MyString",
      :street2 => "MyString",
      :city => "MyString",
      :province => nil,
      :postalcode => "MyString",
      :phone => "MyString",
      :googleplus => "MyString",
      :facebook => "MyString",
      :linkedin => "MyString",
      :twitter => "MyString",
      :shortdescription => "MyString",
      :longdescription => "MyString",
      :tags => "MyString",
      :citationemail => "MyString",
      :businessemail => "MyString",
      :login => "MyString",
      :password => "MyString",
      :timezone => "MyString"
    ))
  end

  it "renders the edit company form" do
    render

    assert_select "form[action=?][method=?]", company_path(@company), "post" do

      assert_select "input#company_user_id[name=?]", "company[user_id]"

      assert_select "input#company_cname[name=?]", "company[cname]"

      assert_select "input#company_street1[name=?]", "company[street1]"

      assert_select "input#company_street2[name=?]", "company[street2]"

      assert_select "input#company_city[name=?]", "company[city]"

      assert_select "input#company_province_id[name=?]", "company[province_id]"

      assert_select "input#company_postalcode[name=?]", "company[postalcode]"

      assert_select "input#company_phone[name=?]", "company[phone]"

      assert_select "input#company_googleplus[name=?]", "company[googleplus]"

      assert_select "input#company_facebook[name=?]", "company[facebook]"

      assert_select "input#company_linkedin[name=?]", "company[linkedin]"

      assert_select "input#company_twitter[name=?]", "company[twitter]"

      assert_select "input#company_shortdescription[name=?]", "company[shortdescription]"

      assert_select "input#company_longdescription[name=?]", "company[longdescription]"

      assert_select "input#company_tags[name=?]", "company[tags]"

      assert_select "input#company_citationemail[name=?]", "company[citationemail]"

      assert_select "input#company_businessemail[name=?]", "company[businessemail]"

      assert_select "input#company_login[name=?]", "company[login]"

      assert_select "input#company_password[name=?]", "company[password]"

      assert_select "input#company_timezone[name=?]", "company[timezone]"
    end
  end
end
