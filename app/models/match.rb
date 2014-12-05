class Match < ActiveRecord::Base
  validates_presence_of :date
  validates_presence_of :home_team
  validates_presence_of :home_team_score
  validates_presence_of :away_team
  validates_presence_of :away_team_score
end
