# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable, :omniauthable and :recoverable
  devise :database_authenticatable, :registerable, :rememberable, :validatable

  enum locale: { Ukrainian: 'uk', English: 'en' }
  enum role: { user: 0, author: 1, editor: 2, admin: 3 }

  has_many :authors, dependent: :nullify
  has_many :books, dependent: :nullify
  has_many :book_reactions, dependent: :destroy
  has_many :lists, dependent: :destroy

  validates_presence_of :nickname
  validates_presence_of :locale

  after_create_commit { Lists::DefaultCreator.new(self).call }

  def author_or_higher?
    author? || editor? || admin?
  end

  def editor_or_higher?
    editor? || admin?
  end
end
