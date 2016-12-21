require 'rails_helper'

RSpec.describe "citations/show", type: :view do
  before(:each) do
    @citation = assign(:citation, Citation.create!(
      :citation_source => nil,
      :property => nil,
      :napmatch => false,
      :url => "Url",
      :pa => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/Url/)
    expect(rendered).to match(/1/)
  end
end
