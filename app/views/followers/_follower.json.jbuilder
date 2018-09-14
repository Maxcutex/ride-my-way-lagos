# frozen_string_literal: true

json.extract! follower, :id, :created_at, :updated_at
json.url follower_url(follower, format: :json)
