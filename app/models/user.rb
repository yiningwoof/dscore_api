class User < ApplicationRecord
    has_many :rounds
    has_many :games, through: :rounds
    has_one_attached :avatar
    has_secure_password #hashes password in DB
    validates :email, presence: true, uniqueness: true
end
