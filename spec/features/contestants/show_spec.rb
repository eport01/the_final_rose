require 'rails_helper'

RSpec.describe 'contestants show page' do 
  before :each do 
    @mary = Bachelorette.create!(name: "Mary", season_number: 12, description: "coolest season")
    @amy = Bachelorette.create!(name: "Amy", season_number: 8, description: "fun times")
    @suzie = Bachelorette.create!(name: "Suzie", season_number: 10, description: "great experience")
    @mark = @mary.contestants.create!(name: "Mark", age: 30, hometown: "Denver")
    @fun = Outing.create!(bachelorette_id: @mary, contestant_id: @mark)
    @steve = @mary.contestants.create!(name: "Steve", age: 29, hometown: "Aurora")

  end

  it 'shows me contestants info and season number and description' do 
    visit contestant_path(@mark)
    expect(page).to have_content("Mark")
    expect(page).to have_content(12)
    expect(page).to have_content("coolest season")
  end 
end