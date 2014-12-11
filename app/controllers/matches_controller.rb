class MatchesController < ApplicationController
  skip_before_action :authenticate_user!
  
  def index
    @matches = Match.order(date: :desc).paginate(page: params[:page], per_page: 5).decorate
  end
end
