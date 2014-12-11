class MatchesController < ApplicationController
  def index
    @matches = Match.order(date: :desc).paginate(page: params[:page], per_page: 5).decorate
  end
end
