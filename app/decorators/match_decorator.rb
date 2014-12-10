class MatchDecorator < Draper::Decorator
  delegate_all
  include Draper::LazyHelpers

  def match_date
    model.date.strftime('%d %b %Y')
  end

  def home_score_color
    if model.home_win?
      'score-win'
    elsif model.away_win?
      'score-lose'
    elsif model.draw?
      'score-draw'
    end
  end

  def away_score_color
    if model.away_win?
      'score-win'
    elsif model.home_win?
      'score-lose'
    elsif model.draw?
      'score-draw'
    end
  end
end
