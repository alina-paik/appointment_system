# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :jwt_cookie_authenticatable,
         :jwt_authenticatable,
         :registerable,
         jwt_revocation_strategy: JwtDenylist

  validates :name, :phone_number, presence: true
  validates :phone_number, uniqueness: true,
             numericality: true,
             length: { in: 10..15 },
             format: { with: /\d[0-9]\)*/, message:"only positive number without spaces are allowed" }
  validates :name, length: { maximum: 20 }
end
