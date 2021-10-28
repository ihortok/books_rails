# frozen_string_literal: true

class Author < ApplicationRecord
  has_one_attached :image

  belongs_to :user
end
