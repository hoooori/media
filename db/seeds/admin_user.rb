# frozen_string_literal: true

AdminUser.create!(
  email: 'media-admin@example.com',
  password: 'password',
  password_confirmation: 'password'
) unless AdminUser.exists?(email: 'media-admin@example.com')
