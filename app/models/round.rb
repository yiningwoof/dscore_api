class Round < ApplicationRecord
  belongs_to :user
  belongs_to :game
  has_many :scores
  has_many :holes, through: :scores
end
