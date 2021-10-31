# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    nickname { "#{Faker::Internet.username}#{rand(999_999)}" }
    password { '123456abc@' }
    locale { 'en' }
  end
end
