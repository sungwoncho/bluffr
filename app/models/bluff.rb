class Bluff < ActiveRecord::Base
  validates_presence_of :statement_1
  validates_presence_of :statement_2
  validates_length_of :statement_1, maximum: 90
  validates_length_of :statement_2, maximum: 90
  validates_presence_of :user_id
  validates_presence_of :match_id

  belongs_to :match
  belongs_to :author, class_name: 'User', foreign_key: :user_id
  has_many :likes
  has_many :likers, through: :likes, source: :user

  scope :sort, ->(rule){ 
    case rule
    when 'popular'
      # todo
    end
  }

  def update_cached_likes
    update(cached_likes: self.likes.count)
  end
end