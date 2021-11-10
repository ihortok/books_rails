# frozen_string_literal: true

class Book < ApplicationRecord
  default_scope { order(updated_at: :desc) }

  belongs_to :user
  belongs_to :author
  has_many :book_reactions, dependent: :destroy
  has_and_belongs_to_many :lists

  has_one_attached :image

  validates :title, presence: true
  validates :image, size: { less_than: 250.kilobytes, message: 'is not given between size' }
end
