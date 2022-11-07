class Outing < ApplicationRecord
  # has_many :bachelorette_contestants 
  # has_many :contestants
  has_many :bachelorettes
  has_many :contestant_outings 
  has_many :contestants, through: :contestant_outings

  def contestant_count 
    contestants.count 
  end
end