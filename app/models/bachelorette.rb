class Bachelorette <ApplicationRecord
  has_many :contestants

  def contestant_avg 
    contestants.average(:age)
  end

  def contestant_homes
    contestants.select(:hometown).distinct.pluck(:hometown)
  end
  
end
