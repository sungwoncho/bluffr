require 'rails_helper'

RSpec.describe Match, type: :model do

  it "has a valid factory" do
    expect(build(:match)).to be_valid
  end

  describe "validation" do
    it { should validate_presence_of(:date) }
    it { should validate_presence_of(:home_team) }
    it { should validate_presence_of(:home_team_score) }
    it { should validate_presence_of(:away_team) }
    it { should validate_presence_of(:away_team_score) }
  end

  describe "association" do
    it { should have_many(:bluffs) }
  end

  describe "class methods" do
    describe ".write_match" do
      it "should create matches" do
        expect { 
          Match.write_match
        }.to change(Match, :count).by(2)
      end

      it "should write correct match information" do
        Match.write_match

        first_match = Match.first
        expect(first_match.date).to eq Date.today
        expect(first_match.home_team).to eq 'West Ham'
        expect(first_match.home_team_score).to eq 2
        expect(first_match.away_team).to eq 'Swansea'
        expect(first_match.away_team_score).to eq 1

        second_match = Match.second
        expect(second_match.date).to eq Date.today
        expect(second_match.home_team).to eq 'Aston Villa'
        expect(second_match.home_team_score).to eq 3
        expect(second_match.away_team).to eq 'Leicester'
        expect(second_match.away_team_score).to eq 2
      end
    end
  end

  describe "instance methods" do
    describe "#home_win?" do 

      context "when home team wins" do
        let(:match) { create(:match, home_team_score: 2, away_team_score: 1) }
        specify { expect(match.home_win?).to be true }
      end

      context "when home team loses" do
        let(:match) { create(:match, home_team_score: 2, away_team_score: 3) }
        specify { expect(match.home_win?).to be false }
      end

      context "when draw" do
        let(:match) { create(:match, home_team_score: 1, away_team_score: 1) }
        specify { expect(match.home_win?).to be false }
      end
    end

    describe "#away_win?" do
      
      context "when away team wins" do
        let(:match) { create(:match, home_team_score: 1, away_team_score: 2) }
        specify { expect(match.away_win?).to be true }
      end

      context "when away team loses" do
        let(:match) { create(:match, home_team_score: 2, away_team_score: 1) }
        specify { expect(match.away_win?).to be false }
      end

      context "when draw" do
        let(:match) { create(:match, home_team_score: 1, away_team_score: 1) }
        specify { expect(match.away_win?).to be false }
      end
    end

    describe "#draw?" do
      
      context "when draw" do
        let(:match) { create(:match, home_team_score: 1, away_team_score: 1) }
        specify { expect(match.draw?).to be true }
      end

      context "when home team wins" do
        let(:match) { create(:match, home_team_score: 2, away_team_score: 1) }
        specify { expect(match.draw?).to be false }
      end

      context "when away team wins" do
        let(:match) { create(:match, home_team_score: 1, away_team_score: 2) }
        specify { expect(match.draw?).to be false }
      end
    end
  end



end
