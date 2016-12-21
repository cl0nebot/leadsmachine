require 'rails_helper'

RSpec.describe "citation_sources/index", type: :view do
  before(:each) do
    assign(:citation_sources, [
      CitationSource.create!(
        :site => "Site",
        :submissionurl => "Submissionurl",
        :da => 1,
        :freesubmit => false
      ),
      CitationSource.create!(
        :site => "Site",
        :submissionurl => "Submissionurl",
        :da => 1,
        :freesubmit => false
      )
    ])
  end

  it "renders a list of citation_sources" do
    render
    assert_select "tr>td", :text => "Site".to_s, :count => 2
    assert_select "tr>td", :text => "Submissionurl".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
