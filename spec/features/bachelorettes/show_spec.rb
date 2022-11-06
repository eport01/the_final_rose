require 'rails_helper'

RSpec.describe 'bachelorettes show page' do 
  before :each do 
    @mary = Bachelorette.create!(name: "Mary", season_number: 12, description: "coolest season")
    @amy = Bachelorette.create!(name: "Amy", season_number: 8, description: "fun times")
    @suzie = Bachelorette.create!(name: "Suzie", season_number: 10, description: "great experience")
  end

  it 'i see bachelorettes attributes and a link to their contestants, link takes me to only their contestants' do 
    visit bachelorette_path(@mary) 
    expect(page).to have_content("Mary")
  end
  
end