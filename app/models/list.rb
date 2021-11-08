# frozen_string_literal: true

class List < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :books

  validates :title, presence: true
end
