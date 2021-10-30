# frozen_string_literal: true

class Book < ApplicationRecord
  default_scope { order(updated_at: :desc) }

  has_one_attached :image

  belongs_to :user
  belongs_to :author

  validates :title, presence: true
  validates :image, size: { less_than: 250.kilobytes, message: 'is not given between size' }
end
