# frozen_string_literal: true

FactoryBot.define do
  factory :author do
    user
    name { Faker::Book.author }
    original_name { name }
    wikipedia_url { Faker::Internet.url }
  end
end
