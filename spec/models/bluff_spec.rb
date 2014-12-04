require 'rails_helper'

RSpec.describe Bluff, type: :model do
  describe "validations" do
    it { should ensure_length_of(:statement_1).is_at_most(90) }
    it { should ensure_length_of(:statement_2).is_at_most(90)}
  end
end
