class CreateBluffs < ActiveRecord::Migration
  def change
    create_table :bluffs do |t|
      t.text :statement_1, limit: 90
      t.text :statement_2, limit: 90

      t.timestamps
    end
  end
end
