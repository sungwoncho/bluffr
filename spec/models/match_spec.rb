require 'rails_helper'

RSpec.describe Match, type: :model do
  describe "validation" do
    it { should validate_presence_of(:date) }
    it { should validate_presence_of(:home_team) }
    it { should validate_presence_of(:home_team_score) }
    it { should validate_presence_of(:away_team) }
    it { should validate_presence_of(:away_team_score) }
  end

  describe "class methods" do
    describe ".get_match" do
      it "makes API call and store response to response" do
        Match.get_match
        expect(@response).to be_nil
      end
    end
  end
end
