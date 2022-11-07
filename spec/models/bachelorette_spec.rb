require 'rails_helper'

RSpec.describe Bachelorette, type: :model do
  describe 'relationships' do
    it {should have_many :contestants}
  end

  before :each do 
    @mary = Bachelorette.create!(name: "Mary", season_number: 12, description: "coolest season")
    @amy = Bachelorette.create!(name: "Amy", season_number: 8, description: "fun times")
    @suzie = Bachelorette.create!(name: "Suzie", season_number: 10, description: "great experience")
    @mark = @mary.contestants.create!(name: "Mark", age: 30, hometown: "Denver")
    @fun = Outing.create!(bachelorette_id: @mary.id, name: "Bowling", location: "Denver", date: "2022-11-06 00:00:00 UTC")
    @steve = @mary.contestants.create!(name: "Steve", age: 20, hometown: "Denver")
    ContestantOuting.create!(contestant: @mark, outing: @fun)
    ContestantOuting.create!(contestant: @steve, outing: @fun)
  
  end

  it 'can find average age of a bachs contestants' do 
    expect(@mary.contestant_avg).to eq(25)
  end

  it 'gives a unique list of hometowns' do 
    expect(@mary.contestant_homes).to eq(["Denver"])
  end
end
