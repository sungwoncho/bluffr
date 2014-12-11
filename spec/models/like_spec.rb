require 'rails_helper'

RSpec.describe Like, :type => :model do
  it "has a valid factory" do
    expect(build(:like)).to be_valid
  end

  describe "validation" do
    it { should validate_uniqueness_of(:bluff_id).scoped_to(:user_id) }
  end

  describe "association" do
    it { should belong_to(:user) }
    it { should belong_to(:bluff) }
  end
end
