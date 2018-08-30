
# frozen_string_literal: true

# followers model
class Follower < ApplicationRecord
  belongs_to :ride
  belongs_to :user
end
