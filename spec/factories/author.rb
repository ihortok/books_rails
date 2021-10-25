# frozen_string_literal: true

FactoryBot.define do
  factory :author do
    user
    name { Faker::Book.author }
  end
end

