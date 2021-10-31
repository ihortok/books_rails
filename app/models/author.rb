# frozen_string_literal: true

class Author < ApplicationRecord
  default_scope { order(updated_at: :desc) }

  belongs_to :user

  has_one_attached :image

  validates :name, presence: true
  validates :image, size: { less_than: 250.kilobytes, message: 'is not given between size' }
end
