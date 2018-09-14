# frozen_string_literal: true

# faq Model
class Faq < ApplicationRecord
  validates :title, :answer, presence: true

  def self.get_by_id(id)
    where(id: id).first
  end

  def self.get_by_title(title)
    where(title: title, is_active: true)
  end
end
