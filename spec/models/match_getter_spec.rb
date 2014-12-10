require 'rails_helper'

RSpec.describe MatchGetter, type: :model do

  let(:match_getter) { MatchGetter.new(Date.today) }

  describe "initialize" do
    it "assigns date" do
      date = Date.new(2014, 12, 1)
      match_getter = MatchGetter.new(date)
      expect(match_getter.date).to eq date
    end
  end

  describe "#get_match" do
    it "returns JSON response containing match details" do
      response = match_getter.get_match
      parsed_response = JSON.parse(response)
      expect(parsed_response['matches']).to eq JSON.parse(FootballAPISample::RESPONSE)['matches']
    end
  end
end