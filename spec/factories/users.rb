# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    nickname { "#{Faker::Internet.username}#{rand(999_999)}" }
    password { Faker::Internet.password }
    locale { 'en' }

    trait :author do
      role { 'author' }
    end

    trait :editot do
      role { 'editot' }
    end

    trait :admin do
      role { 'admin' }
    end
  end
end
