require 'rails_helper'

RSpec.describe "citations/index", type: :view do
  before(:each) do
    assign(:citations, [
      Citation.create!(
        :citation_source => nil,
        :property => nil,
        :napmatch => false,
        :url => "Url",
        :pa => 1
      ),
      Citation.create!(
        :citation_source => nil,
        :property => nil,
        :napmatch => false,
        :url => "Url",
        :pa => 1
      )
    ])
  end

  it "renders a list of citations" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "Url".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
