class Like < ActiveRecord::Base
  validates_uniqueness_of :bluff_id, scope: :user_id
  validate :ensure_not_author

  belongs_to :user
  belongs_to :bluff

  private

    # def ensure_not_author
    #   errors.add :user_id, "is the author of this bluff" if bluff.user_id == current_user.id
    # end
end
