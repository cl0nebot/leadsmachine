require 'rails_helper'

RSpec.describe "citation_sources/edit", type: :view do
  before(:each) do
    @citation_source = assign(:citation_source, CitationSource.create!(
      :site => "MyString",
      :submissionurl => "MyString",
      :da => 1,
      :freesubmit => false
    ))
  end

  it "renders the edit citation_source form" do
    render

    assert_select "form[action=?][method=?]", citation_source_path(@citation_source), "post" do

      assert_select "input#citation_source_site[name=?]", "citation_source[site]"

      assert_select "input#citation_source_submissionurl[name=?]", "citation_source[submissionurl]"

      assert_select "input#citation_source_da[name=?]", "citation_source[da]"

      assert_select "input#citation_source_freesubmit[name=?]", "citation_source[freesubmit]"
    end
  end
end
