class AddUserIdToBluffs < ActiveRecord::Migration
  def change
    add_reference :bluffs, :user, index: true
  end
end
