# frozen_string_literal: true

FactoryBot.define do
  factory :spina_user, class: Spina::User do
    sequence(:email) { |n| "user#{n}@someaddress.com" }
    name { 'Marcus Atherton' }
    password_digest { BCrypt::Password.create('password') }
    admin { true }
  end
end
