class Contest < ApplicationRecord
  belongs_to :admin
  has_many :votes
  has_many :entries
end
