class Match < ActiveRecord::Base
  validates_presence_of :date
  validates_presence_of :home_team
  validates_presence_of :home_team_score
  validates_presence_of :away_team
  validates_presence_of :away_team_score

  has_many :bluffs, dependent: :destroy

  def home_win?
    home_team_score > away_team_score
  end

  def away_win?
    away_team_score > home_team_score
  end

  def draw?
    away_team_score == home_team_score
  end

  def self.write_match
    today = Date.today
    match_getter = MatchGetter.new(today)
    response = JSON.parse match_getter.get_match

    response['matches'].each do |match|
      home_team = match['match_localteam_name']
      home_team_score = match['match_localteam_score']
      away_team = match['match_visitorteam_name']
      away_team_score = match['match_visitorteam_score']

    Match.create(
      date: today,
      home_team: home_team,
      home_team_score: home_team_score,
      away_team: away_team,
      away_team_score: away_team_score
      )

    end
  end
end
