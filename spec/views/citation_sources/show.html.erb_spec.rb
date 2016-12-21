require 'rails_helper'

RSpec.describe "citation_sources/show", type: :view do
  before(:each) do
    @citation_source = assign(:citation_source, CitationSource.create!(
      :site => "Site",
      :submissionurl => "Submissionurl",
      :da => 1,
      :freesubmit => false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Site/)
    expect(rendered).to match(/Submissionurl/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/false/)
  end
end
