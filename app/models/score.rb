class Score < ApplicationRecord
  belongs_to :round, optional: true
  belongs_to :hole
end
