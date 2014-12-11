require 'rails_helper'

RSpec.describe Bluff, type: :model do
  it "has a valid factory" do
    expect(build(:bluff)).to be_valid
  end

  describe "validations" do
    it { should validate_presence_of(:statement_1) }
    it { should validate_presence_of(:statement_2) }
    it { should ensure_length_of(:statement_1).is_at_most(90) }
    it { should ensure_length_of(:statement_2).is_at_most(90)}
    it { should validate_presence_of(:user_id) }
    it { should validate_presence_of(:match_id) }
  end

  describe "association" do
    it { should belong_to(:match) }
    it { should belong_to(:author).class_name('User') }
    it { should have_many(:likes) }
    it { should have_many(:likers).through(:likes).source(:user) }
  end

  describe "instance methods" do

    let(:bluff) { create(:bluff) }

    describe "#like_count" do
      it "counts the number of likes" do
        3.times do |n|
          create(:like, bluff_id: bluff.id, user_id: n)
        end

        expect(bluff.like_count).to eq 3
      end
    end
  end
end
