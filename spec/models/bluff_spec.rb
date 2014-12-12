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
  end

  describe "association" do
    it { should belong_to(:match) }
    it { should belong_to(:author).class_name('User') }
    it { should have_many(:likes) }
    it { should have_many(:likers).through(:likes).source(:user) }
  end

  describe "instance methods" do
    describe "#update_cached_likes" do
      it "updates the cached likes with current like counts" do
        bluff = create(:bluff)
        create(:like, bluff: bluff)
        create(:like, bluff: bluff)
        Like.last.destroy

        expect { 
          bluff.update_cached_likes
        }.to change(bluff, :cached_likes).by(1)
      end
    end
  end
end
