class AddCachedLikesToBluffs < ActiveRecord::Migration
  def change
    add_column :bluffs, :cached_likes, :integer, default: 0
  end
end
