require 'rails_helper'

RSpec.describe Outing, type: :model do
  describe 'relationships' do
    it {should have_many(:contestants).through(:bachelorette_contestants)}

  end
end
