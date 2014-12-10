class MatchesController < ApplicationController
  def index
    @matches = Match.all.decorate
  end
end
