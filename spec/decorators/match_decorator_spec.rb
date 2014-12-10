require 'rails_helper'

RSpec.describe MatchDecorator, type: :decorator do
  describe "home_score_color" do
    context "when home team wins" do
      it "should output 'score-win'" do
        match = create(:match, home_team_score: 2, away_team_score: 1)
        expect(match.decorate.home_score_color).to eq 'score-win'
      end
    end

    context "when draw" do
      it "should output 'score-draw'" do
        match = create(:match, home_team_score: 1, away_team_score: 1)
        expect(match.decorate.home_score_color).to eq 'score-draw'
      end
    end

    context "when away team wins" do
      it "should output 'score-lose'" do
        match = create(:match, home_team_score: 1, away_team_score: 2)
        expect(match.decorate.home_score_color).to eq 'score-lose'
      end
    end
  end

  describe "away_score_color" do
    context "when away team wins" do
      it "should output 'score-win'" do
        match = create(:match, home_team_score: 1, away_team_score: 2)
        expect(match.decorate.away_score_color).to eq 'score-win'
      end
    end

    context "when draw" do
      it "should output 'score-draw'" do
        match = create(:match, home_team_score: 1, away_team_score: 1)
        expect(match.decorate.away_score_color).to eq 'score-draw'
      end
    end

    context "when home team wins" do
      it "should output 'score-lose'" do
        match = create(:match, home_team_score: 2, away_team_score: 1)
        expect(match.decorate.away_score_color).to eq 'score-lose'
      end
    end
  end
end
