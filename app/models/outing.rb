class Outing < ApplicationRecord
  # has_many :bachelorette_contestants 
  has_many :contestants
  has_many :bachelorettes, through: :contestants
end