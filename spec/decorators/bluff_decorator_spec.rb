require 'rails_helper'

describe BluffDecorator, type: :decorator do

  let(:user) { create(:user) }

  before :each do
    sign_in user
  end

  describe "like_button" do

    context "with no duplicate likes" do
      it "outputs like button" do
        bluff = create(:bluff)

        expect(bluff.decorate.like_button).to include 'like'
      end
    end

    context "with duplicate likes" do
      it "outputs nothing" do
        bluff = create(:bluff)
        create(:like, bluff_id: bluff.id, user_id: user.id)
        expect(bluff.decorate.like_button).to eq nil
      end
    end
  end

  describe "unlike_button" do
    
    context "when Like already exists" do
      it "outputs unlike button" do
        bluff = create(:bluff)
        create(:like, bluff_id: bluff.id, user_id: user.id)

        expect(bluff.decorate.unlike_button).to include 'unlike'
      end
    end
  end

  describe "author_name" do
    it "outputs author's username" do
      user = create(:user, username: 'test_user_1')
      bluff = create(:bluff, user_id: user.id)
      expect(bluff.decorate.author_name).to eq 'test_user_1'
    end
  end

  describe "like_count" do
    it "counts the number of likes" do
      bluff = create(:bluff)

      3.times do |n|
        create(:like, bluff_id: bluff.id, user_id: n)
      end

      expect(bluff.decorate.like_count).to eq 3
    end
  end
end
