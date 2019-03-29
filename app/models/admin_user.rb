# frozen_string_literal: true

class AdminUser < ApplicationRecord
  # :registerable, :confirmable, :lockable, :timeoutable, :omniauthable, :recoverable
  # https://qiita.com/cigalecigales/items/73d7bd7ec59a001ccd74
  devise :database_authenticatable, :rememberable, :validatable, :trackable

  has_many :posts, dependent: :delete_all
end
