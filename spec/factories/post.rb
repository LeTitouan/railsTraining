# frozen_string_literal: true

FactoryBot.define do
  factory :post do
    title { Faker::GreekPhilosophers.name }
    content { Faker::GreekPhilosophers.quote }
    user
  end
end
