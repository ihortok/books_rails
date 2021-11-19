# frozen_string_literal: true

class Author < ApplicationRecord
  default_scope { order(updated_at: :desc) }

  belongs_to :user

  has_many :books
  has_one_attached :image

  validates :name, presence: true
  validates :original_name, presence: true
  validates :image, size: { less_than: 250.kilobytes, message: 'size must be less than 250 kilobytes' }
end
