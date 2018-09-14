class HomeController < ApplicationController
  layout :resolve_layout
  before_action :set_faq, only: [:faq_show]
  def index
  end

  def faqs
    @faqs = Faq.all
  end

  def faq_show
  end

  def contact
  end

  private

  def set_faq
    @faq = Faq.find(params[:id])
  end

  def resolve_layout
    case action_name
    when "contact", "faqs"
      "app_layout"
    when "index"
      "app_layout"
    else
      "application"
    end
  end
end
