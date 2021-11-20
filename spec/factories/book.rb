# frozen_string_literal: true

FactoryBot.define do
  factory :book do
    user
    author
    title { Faker::Book.title }
    original_title { title }
    description { Faker::Lorem.paragraph }
    goodreads_url { Faker::Internet.url }
  end
end
