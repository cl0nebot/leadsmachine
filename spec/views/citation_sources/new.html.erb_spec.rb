require 'rails_helper'

RSpec.describe "citation_sources/new", type: :view do
  before(:each) do
    assign(:citation_source, CitationSource.new(
      :site => "MyString",
      :submissionurl => "MyString",
      :da => 1,
      :freesubmit => false
    ))
  end

  it "renders new citation_source form" do
    render

    assert_select "form[action=?][method=?]", citation_sources_path, "post" do

      assert_select "input#citation_source_site[name=?]", "citation_source[site]"

      assert_select "input#citation_source_submissionurl[name=?]", "citation_source[submissionurl]"

      assert_select "input#citation_source_da[name=?]", "citation_source[da]"

      assert_select "input#citation_source_freesubmit[name=?]", "citation_source[freesubmit]"
    end
  end
end
