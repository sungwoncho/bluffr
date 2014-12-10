class MatchesController < ApplicationController
  def index
    @matches = Match.order(date: :desc).decorate
  end
end
