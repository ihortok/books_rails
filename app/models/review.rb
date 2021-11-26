# == Schema Information
#
# Table name: reviews
#
#  id         :bigint           not null, primary key
#  content    :text
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  book_id    :bigint
#  user_id    :bigint
#
# Indexes
#
#  index_reviews_on_book_id  (book_id)
#  index_reviews_on_user_id  (user_id)
#
class Review < ApplicationRecord
  belongs_to :user
  belongs_to :book

  validates_presence_of :title
  validates :content, presence: true, length: { minimum: 100 }

  has_rich_text :content
end
