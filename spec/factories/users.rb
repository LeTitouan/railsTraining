# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    username { Faker::Name.name }
    email { Faker::Internet.email }
    encrypted_password { "123456" }
  end
end
