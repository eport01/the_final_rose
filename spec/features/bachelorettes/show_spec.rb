require 'rails_helper'

RSpec.describe 'bachelorettes show page' do 
  before :each do 
    @mary = Bachelorette.create!(name: "Mary", season_number: 12, description: "coolest season")
    @amy = Bachelorette.create!(name: "Amy", season_number: 8, description: "fun times")
    @suzie = Bachelorette.create!(name: "Suzie", season_number: 10, description: "great experience")
    @mark = @mary.contestants.create!(name: "Mark", age: 30, hometown: "Denver")
    @fun = Outing.create!(bachelorette_id: @mary, contestant_id: @mark)
  
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
  
end