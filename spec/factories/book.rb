# frozen_string_literal: true

FactoryBot.define do
  factory :book do
    user
    author
    title { Faker::Book.title }
  end
end
