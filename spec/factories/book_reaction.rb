# frozen_string_literal: true

FactoryBot.define do
  factory :book_reaction do
    user
    book

    trait :liked do
      like { true }
    end
  end
end
