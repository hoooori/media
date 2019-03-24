# frozen_string_literal: true

class User < ApplicationRecord
  # 使わないやつ→ :registerable, :confirmable, :lockable, :timeoutable, :omniauthable, :recoverable
  # https://qiita.com/cigalecigales/items/73d7bd7ec59a001ccd74
  devise :database_authenticatable, :rememberable, :validatable, :trackable
end
