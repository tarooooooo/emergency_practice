class Animal < ApplicationRecord
  has_many :breeds
  has_many :pets
end
