class Entry < ApplicationRecord
  belongs_to :user

  has_one_attached :image
  validates :description, presence: true
end
