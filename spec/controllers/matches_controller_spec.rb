require 'rails_helper'

RSpec.describe MatchesController, :type => :controller do
  describe "GET index" do
    context "without params" do
      it "should assign all matches to @matches" do
        match_1 = create(:match)
        match_2 = create(:match)

        get :index
        expect(assigns(:matches)).to match_array [match_1, match_2]
      end
    end

    it "should decorate @matches" do
      get :index
      expect(assigns(:matches)).to be_decorated
    end
  end
end
