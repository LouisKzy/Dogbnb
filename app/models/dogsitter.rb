class Dogsitter < ApplicationRecord
  has_many :dogs, through: :stralls
  has_many :stralls
  belongs_to :city
end
