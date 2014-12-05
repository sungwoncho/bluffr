require 'rails_helper'

RSpec.describe Match, type: :model do
  describe "validation" do
    it { should validate_presence_of(:date) }
    it { should validate_presence_of(:home_team) }
    it { should validate_presence_of(:home_team_score) }
    it { should validate_presence_of(:away_team) }
    it { should validate_presence_of(:away_team_score) }
  end
end
