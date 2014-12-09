require 'rails_helper'
require 'support/football_api_sample.rb'

RSpec.describe MatchGetter, type: :model do

  let(:match_getter) { MatchGetter.new(Date.today) }
  let(:api_response) { FootballAPISample::RESPONSE }

  describe "initialize" do
    it "assigns date" do
      date = Date.new(2014, 12, 1)
      match_getter = MatchGetter.new(date)
      expect(match_getter.date).to eq date
    end
  end

  describe "#get_match" do
    it "returns JSON response containing match details" do
      # Stub out the API call
      expect(match_getter).to receive(:get_match).and_return(api_response)

      response = match_getter.get_match
      expect(JSON.parse(response)['matches']).not_to be nil
    end
  end
end