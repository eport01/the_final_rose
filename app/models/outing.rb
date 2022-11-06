class Outing < ApplicationRecord
  has_many :bachelorette_contestants 
  has_many :contestants, through: :bachelorette_contestants
  has_many :bachelorettes, through: :bachelorette_contestants
end