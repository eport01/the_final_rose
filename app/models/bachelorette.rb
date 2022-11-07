class Bachelorette <ApplicationRecord
  has_many :contestants

  def contestant_avg 
    contestants.average(:age)
  end
  
end
