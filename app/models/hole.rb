class Hole < ApplicationRecord
  has_many :scores
  has_many :rounds, through: :scores
end
