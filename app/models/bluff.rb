class Bluff < ActiveRecord::Base
  validates_presence_of :statement_1
  validates_presence_of :statement_2
  validates_length_of :statement_1, maximum: 90
  validates_length_of :statement_2, maximum: 90

  belongs_to :match
  belongs_to :author, class_name: 'User', foreign_key: :user_id
  has_many :likes
  has_many :likers, through: :likes, source: :user

  scope :sort, ->(sort){ 
    case sort
    when 'popular'
      order(cached_likes: :desc)
    when 'newest'
      order(created_at: :desc)
    end
  }

  def update_cached_likes
    update(cached_likes: self.likes.count)
  end
end