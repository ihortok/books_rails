# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable, :omniauthable and :recoverable
  devise :database_authenticatable, :registerable, :rememberable, :validatable

  has_many :authors
  has_many :books
end
