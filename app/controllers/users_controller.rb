class UsersController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_user

  # GET /users/1
  def show
  end

  private

    def set_user
      @user = User.find_by(username: params[:id]).decorate
    end
end
