class ChangeVisitingTeamToAwayTeam < ActiveRecord::Migration
  def change
    rename_column :matches, :visiting_team, :away_team
    rename_column :matches, :visiting_team_score, :away_team_score
  end
end
