class Breed < ApplicationRecord
  belongs_to :animal
  has_many :pets
end
