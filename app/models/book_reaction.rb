# frozen_string_literal: true

class BookReaction < ApplicationRecord
  belongs_to :user
  belongs_to :book

  validates :book, uniqueness: { scope: :user }
end
