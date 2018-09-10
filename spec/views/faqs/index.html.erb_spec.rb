require 'rails_helper'

RSpec.describe "faqs/index", type: :view do
  before(:each) do
    assign(:faqs, [
      Faq.create!(
        :title => "Title",
        :answer => "Answer",
        :is_active => false
      ),
      Faq.create!(
        :title => "Title",
        :answer => "Answer",
        :is_active => false
      )
    ])
  end

  it "renders a list of faqs" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Answer".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
