require 'rails_helper'

RSpec.describe Bluff, type: :model do
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
    it { should belong_to(:user) }
  end

  it "has a valid factory" do
    expect(build(:bluff)).to be_valid
  end
end
