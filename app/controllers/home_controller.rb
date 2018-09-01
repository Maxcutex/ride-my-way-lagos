class HomeController < ApplicationController
  layout :resolve_layout
  # layout "app_layout", only: [:dashboard]
  def index
  end

  def faqs
  end

  def contact
  end

  private

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
