# frozen_string_literal: true

# application record class inheriting from Active REcord Base
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end
