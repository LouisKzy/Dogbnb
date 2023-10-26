class Dog < ApplicationRecord
  has_many :strall
  has_many :doggsitters, through: :stralls
  belongs_to :city
end
