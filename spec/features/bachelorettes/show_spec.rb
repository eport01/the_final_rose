require 'rails_helper'

RSpec.describe 'bachelorettes show page' do 
  before :each do 
    @mary = Bachelorette.create!(name: "Mary", season_number: 12, description: "coolest season")
    @amy = Bachelorette.create!(name: "Amy", season_number: 8, description: "fun times")
    @suzie = Bachelorette.create!(name: "Suzie", season_number: 10, description: "great experience")
    @mark = @mary.contestants.create!(name: "Mark", age: 30, hometown: "Denver")
    @fun = Outing.create!(bachelorette_id: @mary.id, name: "Bowling", location: "Denver", date: "2022-11-06 00:00:00 UTC")
    @steve = @mary.contestants.create!(name: "Steve", age: 20, hometown: "Aurora")
    ContestantOuting.create!(contestant: @mark, outing: @fun)
    ContestantOuting.create!(contestant: @steve, outing: @fun)
  
  end

  it 'i see bachelorettes attributes and a link to their contestants, link takes me to only their contestants' do 
    visit bachelorette_path(@mary) 
    expect(page).to have_content("Mary")
    expect(page).to have_content(12)
    expect(page).to have_content("coolest season")
    expect(page).to have_link("Mary's Contestants")
    click_link "Mary's Contestants"
    # require 'pry'; binding.pry
    expect(current_path).to eq(bachelorette_contestants_path(@mary))
    expect(page).to have_content("Mark")

  end

  it 'i see average age of all bachelorettes contestants' do 
    visit bachelorette_path(@mary) 
    expect(page).to have_content("Average Age of Contestants: 25")

  end
  
end