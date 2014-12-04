class CreateStatements < ActiveRecord::Migration
  def change
    create_table :statements do |t|
      t.text :statement
      t.belongs_to :team

      t.timestamps
    end
  end
end
