class Entry < ApplicationRecord
  belongs_to :user
  belongs_to :contest
  belongs_to :pet

  has_many :votes

  has_one_attached :image
  validates :description, presence: true
end
