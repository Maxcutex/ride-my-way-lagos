# frozen_string_literal: true

json.extract! faq, :id, :title, :answer, :is_active, :created_at, :updated_at
json.url faq_url(faq, format: :json)
