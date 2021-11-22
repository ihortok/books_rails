# frozen_string_literal: true

# == Schema Information
#
# Table name: authors
#
#  id            :bigint           not null, primary key
#  name          :string
#  original_name :string
#  wikipedia_url :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  user_id       :bigint
#
# Indexes
#
#  index_authors_on_user_id  (user_id)
#
class Author < ApplicationRecord
  default_scope { order(updated_at: :desc) }

  belongs_to :user

  has_many :books
  has_one_attached :image

  validates_presence_of :name
  validates_presence_of :original_name
  validates :image, size: { less_than: 250.kilobytes, message: 'size must be less than 250 kilobytes' }
end
