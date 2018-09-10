require 'rails_helper'

RSpec.describe "faqs/show", type: :view do
  before(:each) do
    @faq = assign(:faq, Faq.create!(
      :title => "Title",
      :answer => "Answer",
      :is_active => false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Answer/)
    expect(rendered).to match(/false/)
  end
end
