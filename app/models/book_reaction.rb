# frozen_string_literal: true

class BookReaction < ApplicationRecord
  belongs_to :user
  belongs_to :book
end
