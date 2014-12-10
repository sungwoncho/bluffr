require 'rails_helper'

RSpec.describe Match, type: :model do
  describe "validation" do
    it { should validate_presence_of(:date) }
    it { should validate_presence_of(:home_team) }
    it { should validate_presence_of(:home_team_score) }
    it { should validate_presence_of(:away_team) }
    it { should validate_presence_of(:away_team_score) }
  end

  describe "write_match" do
    it "should create matches" do
      expect { 
        Match.write_match
      }.to change(Match, :count).by(2)
    end

    it "does something" do
      
    end
  end
end
