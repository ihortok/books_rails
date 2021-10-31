# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable, :omniauthable and :recoverable
  devise :database_authenticatable, :registerable, :rememberable, :validatable

  enum locale: { Ukrainian: 'uk', English: 'en' }

  has_many :authors
  has_many :books

  validates :nickname, presence: true
  validates :locale, presence: true
end
