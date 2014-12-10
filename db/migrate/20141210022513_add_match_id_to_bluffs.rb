class AddMatchIdToBluffs < ActiveRecord::Migration
  def change
    add_reference :bluffs, :match, index: true
  end
end
