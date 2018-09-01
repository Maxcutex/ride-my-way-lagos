class HomeController < ApplicationController
  layout :resolve_layout
  # layout "app_layout", only: [:dashboard]
  def index
  end

  def dashboard
  end
  private

  def resolve_layout
    case action_name
    when "dashboard"
      "app_layout"
    when "index"
      "app_layout"
    else
      "application"
    end
  end
end
