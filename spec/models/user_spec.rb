require 'rails_helper'

RSpec.describe User, :type => :model do
  it "has a valid factory" do
    expect(build(:user)).to be_valid
  end

  describe "valdiation" do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password) }
    it { should validate_presence_of(:username) }
    it { should ensure_length_of(:username).is_at_most(15) }
    it { should validate_uniqueness_of(:username) }
    it { should allow_value("john1", "john2", "john_1").for(:username) }
    it { should_not allow_value("@", "john#", "<>=").for(:username) }
  end

  describe "association" do
    it { should have_many(:likes).dependent(:destroy) }
    it { should have_many(:liked_bluffs).through(:likes).source(:bluff) }
    it { should have_many(:authored_bluffs).class_name('Bluff').dependent(:destroy) }
  end

  describe "instance methods" do

    let(:user) { create(:user) }
    let(:bluff) { create(:bluff) }

    describe "liked?" do
      context "when user liked the bluff" do
        before { create(:like, user: user, bluff: bluff) }
        specify { expect(user.liked?(bluff)).to be true }
      end

      context "when user has not liked the bluff" do
        specify { expect(user.liked?(bluff)).to be false }
      end
    end
  end
end
