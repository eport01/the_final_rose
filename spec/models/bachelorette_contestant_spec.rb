require 'rails_helper'

RSpec.describe BacheloretteContestant, type: :model do
  describe 'relationships' do
    it {should belong_to :bachelorette}
    it {should belong_to :contestant}

  end
end
