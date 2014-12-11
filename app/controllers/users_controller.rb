class UsersController < ApplicationController
  before_action :set_user

  # GET /users/1
  def show
  end

  private

    def set_user
      @user = User.find_by(username: params[:id]).decorate
    end
end
