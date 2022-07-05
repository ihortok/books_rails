# frozen_string_literal: true

# == Schema Information
#
# Table name: books
#
#  id             :bigint           not null, primary key
#  description    :text
#  goodreads_url  :string
#  original_title :string
#  published      :integer
#  title          :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  author_id      :bigint
#  user_id        :bigint
#
# Indexes
#
#  index_books_on_author_id  (author_id)
#  index_books_on_user_id    (user_id)
#
class Book < ApplicationRecord
  default_scope { order(updated_at: :desc) }

  belongs_to :user
  belongs_to :author

  has_many :book_reactions, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_and_belongs_to_many :lists
  has_one_attached :image

  validates :title, presence: true
  validates :original_title, presence: true
  validates :image, size: { less_than: 250.kilobytes, message: 'size must be less than 250 kilobytes' }
end
