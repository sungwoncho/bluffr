require 'rails_helper'

RSpec.describe MatchesController, :type => :controller do
  describe "GET index" do
    context "without params" do

      before :each do
        @match_1 = create(:match, date: Date.new(2014,11,15))
        @match_2 = create(:match, date: Date.new(2014,1,8))
        @match_3 = create(:match, date: Date.new(2014,5,19))
      end

      it "should assign all matches to @matches" do
        get :index
        expect(assigns(:matches)).to match_array [@match_1, @match_2, @match_3]
      end

      it "should order matches by date in descending order" do
        get :index
        expect(assigns(:matches)).to eq [@match_1, @match_3, @match_2]
      end
    end

    it "should decorate @matches" do
      get :index
      expect(assigns(:matches)).to be_decorated
    end
  end
end
