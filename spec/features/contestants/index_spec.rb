require 'rails_helper'

RSpec.describe 'a bachelorettes contestants show page' do 
  before :each do 
    @mary = Bachelorette.create!(name: "Mary", season_number: 12, description: "coolest season")
    @amy = Bachelorette.create!(name: "Amy", season_number: 8, description: "fun times")
    @suzie = Bachelorette.create!(name: "Suzie", season_number: 10, description: "great experience")
    @mark = @mary.contestants.create!(name: "Mark", age: 30, hometown: "Denver")
    @fun = Outing.create!(bachelorette_id: @mary, contestant_id: @mark)
    @steve = @mary.contestants.create!(name: "Steve", age: 29, hometown: "Aurora")

  end

  it 'i see names of the bachelorettes contestants and their age and hometown' do 
    visit bachelorette_contestants_path(@mary)
    expect(page).to have_content("Mark")
    expect(page).to have_content("30")
    expect(page).to have_content("Denver")
    expect(page).to have_content("Steve")
    expect(page).to have_link("Mark")
    click_link "Mark"
    expect(current_path).to eq(contestant_path(@mark))
  end

end 