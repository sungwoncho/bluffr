require 'rails_helper'

RSpec.describe User, :type => :model do
  it "has a valid factory" do
    expect(build(:user)).to be_valid
  end

  describe "valdiation" do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password) }
  end

  describe "association" do
    it { should have_many(:bluffs).dependent(:destroy) }
  end
end
