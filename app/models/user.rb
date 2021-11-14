# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable, :omniauthable and :recoverable
  devise :database_authenticatable, :rememberable, :validatable

  enum locale: { Ukrainian: 'uk', English: 'en' }
  enum role: { user: 0, author: 1, editor: 2, admin: 3 }

  has_many :authors
  has_many :books
  has_many :book_reactions
  has_many :lists

  validates :nickname, presence: true
  validates :locale, presence: true
end
