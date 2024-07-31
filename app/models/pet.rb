class Pet < ApplicationRecord
  belongs_to :animal
  belongs_to :breed
  belongs_to :user

  has_many :entries
end
