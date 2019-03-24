# frozen_string_literal: true

unless AdminUser.exists?(email: 'media-admin@example.com')
  AdminUser.create!(
    email: 'media-admin@example.com',
    password: 'password',
    password_confirmation: 'password'
  )
end
