# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  locale                 :string
#  nickname               :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  role                   :integer          default("user")
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
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
  has_many :reviews, dependent: :destroy

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
