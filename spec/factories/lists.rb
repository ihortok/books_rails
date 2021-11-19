# frozen_string_literal: true

FactoryBot.define do
  factory :list do
    user
    title { Faker::Hipster.word }

    trait :with_books do
      after(:create) do |list|
        books = FactoryBot.create_list(:book, 3)

        list.books << books
      end
    end
  end
end
