require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  let(:user) { create(:user) }

  describe "GET show" do
    before :each do
      sign_in user
    end

    it "assigns the requested user as @user" do
      get :show, id: user
      expect(assigns(:user)).to eq(user)
    end

    it "decorates @user" do
      get :show, id: user
      expect(assigns(:user)).to be_decorated
    end
  end
end
