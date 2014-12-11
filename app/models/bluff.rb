class Bluff < ActiveRecord::Base
  validates_presence_of :statement_1
  validates_presence_of :statement_2
  validates_length_of :statement_1, maximum: 90
  validates_length_of :statement_2, maximum: 90
  validates_presence_of :user_id
  validates_presence_of :match_id

  belongs_to :match
  belongs_to :user
  has_many :likes
  has_many :likers, through: :likes, source: :user

  def like_count
    Like.where(bluff_id: self.id).count
  end
end