class Bachelorette <ApplicationRecord
  has_many :contestants

  def contestant_avg 
    contestants.average(:age)
  end

  def contestant_homes
    # contestants.select(:hometown).distinct.pluck(:hometown)
    contestants.distinct.pluck(:hometown)
    # Contestant.joins(:bachelorette).distinct(:hometown).pluck(:hometown)
  end
  
end
