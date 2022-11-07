require 'rails_helper'

RSpec.describe 'outings show page' do 
  before :each do 
    @mary = Bachelorette.create!(name: "Mary", season_number: 12, description: "coolest season")
    @amy = Bachelorette.create!(name: "Amy", season_number: 8, description: "fun times")
    @suzie = Bachelorette.create!(name: "Suzie", season_number: 10, description: "great experience")
    @mark = @mary.contestants.create!(name: "Mark", age: 30, hometown: "Denver")
    @fun = Outing.create!(bachelorette_id: @mary.id, contestant_id: @mark.id, name: "Bowling", location: "Denver", date: "2022-11-06 00:00:00 UTC")
    @steve = @mary.contestants.create!(name: "Steve", age: 29, hometown: "Aurora")

  end

  it 'has outing name, location, and date' do 
    visit outing_path(@fun)
    expect(page).to have_content("Bowling")
    expect(page).to have_content("Denver")
    expect(page).to have_content("Sunday, November 06, 2022")

  end
end