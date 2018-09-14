# frozen_string_literal: true

json.extract! ride, :id, :created_at, :updated_at
json.url ride_url(ride, format: :json)
