class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.date :date
      t.string :home_team
      t.integer :home_team_score
      t.string :visiting_team
      t.integer :visiting_team_score

      t.timestamps
    end
  end
end
