class Contestant <ApplicationRecord
  belongs_to :bachelorette
  has_many :outings
  
end
