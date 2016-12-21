require 'rails_helper'

RSpec.describe "citations/edit", type: :view do
  before(:each) do
    @citation = assign(:citation, Citation.create!(
      :citation_source => nil,
      :property => nil,
      :napmatch => false,
      :url => "MyString",
      :pa => 1
    ))
  end

  it "renders the edit citation form" do
    render

    assert_select "form[action=?][method=?]", citation_path(@citation), "post" do

      assert_select "input#citation_citation_source_id[name=?]", "citation[citation_source_id]"

      assert_select "input#citation_property_id[name=?]", "citation[property_id]"

      assert_select "input#citation_napmatch[name=?]", "citation[napmatch]"

      assert_select "input#citation_url[name=?]", "citation[url]"

      assert_select "input#citation_pa[name=?]", "citation[pa]"
    end
  end
end
