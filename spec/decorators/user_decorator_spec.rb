require 'rails_helper'

describe UserDecorator do

  let(:user) { create(:user) }
  let(:bluff) { create(:bluff) }
  let(:bluff_2) { create(:bluff) }

  describe "joined_date" do
    context "when user joined on 2014-11-1" do
      it "outputs '11 Nov 2014'" do
        user = create(:user, created_at: Date.new(2014,11,1))
        expect(user.decorate.joined_date).to eq '1 Nov 2014'
      end
    end
  end

  describe "bluff_count" do
    it "counts the number of authored bluffs" do
      3.times { create(:bluff, user: user) }
      expect(user.decorate.bluff_count).to eq 3
    end
  end

  describe "like_count" do
    it "counts the number of liked bluffs" do
      create(:like, user: user, bluff: bluff)
      create(:like, user: user, bluff: bluff_2)

      expect(user.decorate.like_count).to eq 2
    end
  end
end
