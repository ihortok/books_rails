# frozen_string_literal: true

# == Schema Information
#
# Table name: book_reactions
#
#  id      :bigint           not null, primary key
#  like    :boolean          default(FALSE)
#  book_id :bigint
#  user_id :bigint
#
# Indexes
#
#  index_book_reactions_on_book_id              (book_id)
#  index_book_reactions_on_user_id              (user_id)
#  index_book_reactions_on_user_id_and_book_id  (user_id,book_id) UNIQUE
#
class BookReaction < ApplicationRecord
  belongs_to :user
  belongs_to :book

  validates :book, uniqueness: { scope: :user }
end
