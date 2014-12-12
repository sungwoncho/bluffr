require 'rails_helper'

RSpec.describe LikesController, :type => :controller do

  let(:user) { create(:user) }
  let!(:match) { create(:match) }
  let!(:bluff) { create(:bluff, match: match) }

  before :each do
    sign_in user
    request.env["HTTP_REFERER"] = match_bluffs_url(match) # for testing redirect_to :back
  end

  describe "POST create" do
    it "should require login" do
      sign_out user
      post :create, id: bluff
      expect(response).to require_login
    end

    context "when logged in" do

      context "with no duplicates" do
        it "creates a new Like" do
          expect { 
            post :create, id: bluff
          }.to change(Like, :count).by(1)
        end

        it "sets Like to belong to the user" do
          post :create, id: bluff
          expect(assigns(:like).user).to eq user
        end

        it "sets Like to belong to the bluff" do
          post :create, id: bluff
          expect(assigns(:like).bluff).to eq bluff
        end

        it "redirects to bluff index" do
          post :create, id: bluff
          expect(response).to redirect_to :back
        end

        it "assigns the bluff to @bluff" do
          post :create, id: bluff
          expect(assigns(:bluff)).to eq bluff
        end

        it "increments cached_likes of the bluff by 1" do
          expect { 
            post :create, id: bluff
            bluff.reload
          }.to change(bluff, :cached_likes).by(1)
        end
      end

      context "with duplicates" do
        it "doesn't create a new Like" do
          create(:like, bluff_id: bluff.id, user_id: user.id)

          expect { 
            post :create, id: bluff
          }.to change(Like, :count).by(0)
        end

        it "redirects to bluff index" do
          post :create, id: bluff
          expect(response).to redirect_to :back
        end
      end
    end
  end

  describe "DELETE destroy" do
    it "should require login" do
      sign_out user
      delete :destroy, id: bluff
      expect(response).to require_login
    end

    context "when logged in" do
      context "when Like exists" do

        before :each do
          @like = create(:like, user: user, bluff: bluff)
          bluff.update_cached_likes
        end

        it "assigns the Like to @like" do
          delete :destroy, id: bluff
          expect(assigns(:like)).to eq @like
        end

        it "destroys the Like" do
          expect {
            delete :destroy, id: bluff
          }.to change(Like, :count).by(-1)
        end

        it "assigns the bluff to @bluff" do
          delete :destroy, id: bluff
          expect(assigns(:bluff)).to eq bluff
        end

        it "reduce the cached_likes" do
          expect { 
            delete :destroy, id: bluff
            bluff.reload
          }.to change(bluff, :cached_likes).by(-1)
        end
      end
    end
  end
end
