require 'rails_helper'

RSpec.describe Outing, type: :model do
  describe 'relationships' do
    it {should have_many(:contestants).through(:contestant_outings)}

  end

  
  before :each do 
    @mary = Bachelorette.create!(name: "Mary", season_number: 12, description: "coolest season")
    @amy = Bachelorette.create!(name: "Amy", season_number: 8, description: "fun times")
    @suzie = Bachelorette.create!(name: "Suzie", season_number: 10, description: "great experience")
    @mark = @mary.contestants.create!(name: "Mark", age: 30, hometown: "Denver")
    @fun = Outing.create!(bachelorette_id: @mary.id, name: "Bowling", location: "Denver", date: "2022-11-06 00:00:00 UTC")
    @steve = @mary.contestants.create!(name: "Steve", age: 29, hometown: "Aurora")
    ContestantOuting.create!(contestant: @mark, outing: @fun)
    ContestantOuting.create!(contestant: @steve, outing: @fun)
  end

  it 'can count how many contestants are at an outing' do 
    expect(@fun.contestant_count).to eq(2)
  end
  
    
end
