require 'rails_helper'

RSpec.describe "faqs/edit", type: :view do
  before(:each) do
    @faq = assign(:faq, Faq.create!(
      :title => "MyString",
      :answer => "MyString",
      :is_active => false
    ))
  end

  it "renders the edit faq form" do
    render

    assert_select "form[action=?][method=?]", faq_path(@faq), "post" do

      assert_select "input[name=?]", "faq[title]"

      assert_select "input[name=?]", "faq[answer]"

      assert_select "input[name=?]", "faq[is_active]"
    end
  end
end
